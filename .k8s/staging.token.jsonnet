[
  {
    apiVersion: 'bitnami.com/v1alpha1',
    kind: 'SealedSecret',
    metadata: {
      annotations: {
        'sealedsecrets.bitnami.com/namespace-wide': 'true',
      },
      name: 'token',
    },
    spec: {
      encryptedData: {
        TG_BOT_TOKEN: 'AgBfTaV/Ksw13K0Wj4WqxAGg7atd8/zXv+8QgCtuv0nA6UxTZUIqn+f0kezcMK/vQK/UKRTHbqCYFWcejfW2R0o/3KoZMcbwijvF983j+Qh/O0wOSASVDcwTSyau2UaPJ6W7yxrvtwIzxLjfCiDKRRPhRgNUki3uoLXYqg4NhOcuFekQ6VOelk+x/GhUTF7D+d/OsPzHOwaHBYah3ORxcassGDi6q+Ak2kiF6xY79IHbzp3WuEqLzJeDpr521MULGaOe6KCItnOh9ZCZe7lo9eteUOJTzb/DrjgyUQrKFXoDWee938xdbBofKYWT1zvyZ7XncRn11hUqBD66yRLqo7MI0bUFxgV+M7xadnDg5pXgi3apEatpJ7KlrSZKb3sEmu1fv2sBX+K8rFV6qpcwOGwmIV2mbNuGgsSXzO3oU+v6LRDdj+bhXjWfdXiFZsPZzTCyjD7fC1R3TSIsBw4eZ30QyJ1RWs1E7I2y6aNYmmkY2uIlHpHGGIz+esuXrdRlPylz6AJ30l1TBoeK66Z5HYPFh7KKwgj+75bpT8BMTWFr+V0epAXNAP9KXphAh+G8GrPVAeORM0wKacv2ENiJhko0XIk1UiM22bRLXMi50fTxB01AFAL85aS2cDKSn0Xn73zDfbBbSphs9FQP/dzrS/K2aFucDwEs+ycVXN8aSx0t8A482PNEmnLauv11XO+BAE+dcmPkNj2FHnj0cR51zr4WRgVnsjGv/pBDWrWNX3XJyXORCMCro9jpEnURJOT7',
      },
      template: {
        metadata: {
          annotations: {
            'sealedsecrets.bitnami.com/namespace-wide': 'true',
          },
          name: 'token',
        },
        type: 'Opaque',
      },
    },
  },
]