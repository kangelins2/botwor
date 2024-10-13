import os
import asyncio
from typing import Callable, Awaitable

import anyio
from anyio.abc import TaskGroup

import dp
import pandas as pd
import uvicorn

from pydantic import BaseModel, Field
from fastapi import FastAPI
from aiogram import Dispatcher, Bot, F
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, Mapped, mapped_column, declarative_base
from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton, WebAppInfo, Message, CallbackQuery, FSInputFile

from aiogram.filters import CommandStart, Command
from dotenv import load_dotenv


load_dotenv(".env")

dp = Dispatcher()
app = FastAPI()


@app.get("/home")
def get_home():
    return "Hello World"


Base = declarative_base()


class BaseORM(Base):
    __abstract__ = True


class Email(BaseORM):
    __tablename__ = 'emails'

    id: Mapped[int] = mapped_column(primary_key=True)
    email: Mapped[str]


def db_setup():
    db_engine = create_engine(os.getenv("DATABASE_URL"))

    db_session_factory = sessionmaker(bind=db_engine)
    with db_session_factory() as session:
        BaseORM.metadata.create_all(db_engine)
        session.commit()
    return db_engine, db_session_factory


engine, session_factory = db_setup()


class EmailRequest(BaseModel):
    email: str = Field(examples=["makaka@mail.com"])


# Определяем маршрут для обработки POST-запроса
@app.post("/emails/")
async def save_email(email: EmailRequest):
    with session_factory() as db:
        email_db = Email(email=email.email)
        db.add(email_db)
        db.commit()
    # Здесь вы можете добавить логику для обработки данных, например, сохранение в базе данных
    return {"status": "Ok"}


@dp.message(CommandStart())
async def url_command(message: Message):
    await message.answer("welcome to viperr", reply_markup=ikb_donate)


ikb_donate = InlineKeyboardMarkup(row_width=1, inline_keyboard=[[
                                          InlineKeyboardButton(text='let’s go',
                                                                    web_app=WebAppInfo(url=f'https://google.com'))
                                      ]
                                  ])


@dp.message(Command('download_emails'))
async def download_price(message: Message):
    with session_factory() as db:
        email_list_db = db.query(Email).all()
        email_list = []
        for email in email_list_db:
            email_list.append(email.email)
    df = pd.DataFrame(email_list, columns=['Emails'])
    csv_file = 'emails.csv'
    df.to_csv(csv_file, index=False)
    document = FSInputFile('emails.csv')
    await message.answer_document(document)


async def start_bot(tg: TaskGroup):
    bot = Bot(token=os.getenv("TG_BOT_TOKEN"))
    await dp.start_polling(bot)
    tg.cancel_scope.cancel()


async def start_server(tg: TaskGroup, server: Callable[[], Awaitable]):
    await server()
    tg.cancel_scope.cancel()


async def main():
    config = uvicorn.Config(
        "main:app", "0.0.0.0", log_level=4, workers=1, reload=False,
    )

    server = uvicorn.Server(config)
    async with anyio.create_task_group() as tg:
        tg.start_soon(start_server, tg, server.serve)
        tg.start_soon(start_bot, tg)
        # tg.start_soon(run_migration)

if __name__ == '__main__':
    asyncio.run(main())
