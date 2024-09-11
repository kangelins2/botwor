if std.extVar("env_slug") == "staging" then [
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
        TG_BOT_TOKEN: 'AgCu0f1t7jyq7Vgwecm0azLNCeofXAjLGnm4WYyi815Wf04Hq/qL+kMgVflp0ugrD4oOiKvPCoR7bN2eRWHXsVvCjRtPcpi44oyBIJc7rdUyRR7Fx192JW7I6DnNjHPPIdtHD80odDGLNbST47hGEHCYKDkVa+xzrO51fC8uvc4sLUFDyS5KzKCL905y+VugynfAHsBUZxj/pQhyJ1ZeAaPHfs2VRtGoICQfUFOIr2P9CYTyOs4lo4meykDok0WAKm8Hjn4ElHekr5MNyvflE28T3x8p034nV+7J75qqHvLYuHW0CuBY000/UiPaD2JDyXzzS5eSTJIxHt/62fyrGMZw8cZztL5BvTcRW6azptc/fzJCFMrTgxTw/PEMIFFe7CLbkjqVfq8PjVjEGl5gdYQRU8ZmgXbauHhioEgtkweULaSF/rZ63gxbedXmW49MV4RgEzPbEXrtjcBlnNqKO0rCS4Waw0O1/VOc3vCJIpKRbilI1DXOtVOLLgKqRX5lqZdceHrczJXyPx4T8zKJyx+X7sR0weW0vmXhmWsBosiJKYMg1w8QXle1XJN9hFEaGzLVGyxAKO0dexkOyeThiRiEVN4JzZCPimv1QqpA6clIAaAHVNF0iYSla7s/NwOJzIdRu71d4jZZxBNhNGkG2MN8bhdnRtU71sj+WCJ+u7BqDVxycQ6fPR5pQgdrKu33xp9y332Rewll69jjT4B/6g2b3Up7QCTK4K7NYUOH2767PMs/3VUV9E1zhQHQEpIw',
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