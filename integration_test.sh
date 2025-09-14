#!/bin/bash
export DEBUG=1
export URL='https://epay.ecnu.edu.cn/epaycas/electric/queryelectricbill'
export ELCBUIS=''
export ROOM_NO=''
export COOKIE=''
export X_CSRF_TOKEN=''
export PUSH_PLUS_TOKEN=''   # add your token
export GITHUB_TRIGGERING_ACTOR='test'
export TELEGRAM_BOT_TOKEN=''  # add your token
export TELEGRAM_USER_IDS=''  # add your id
uv run python main.py
