#!/usr/bin/env bash
set -euo pipefail

# Paperclip sharing setup — run AFTER restarting ngrok on port 8002
# Usage: ./scripts/setup-sharing.sh

PAPERCLIP_PORT=8002
NGROK_API="http://127.0.0.1:4040/api/tunnels"

echo "=== Paperclip Sharing Setup ==="
echo ""

# 1. Verify Paperclip is running
if ! curl -sf "http://127.0.0.1:${PAPERCLIP_PORT}/api/health" > /dev/null 2>&1; then
  echo "❌ Paperclip not running on port ${PAPERCLIP_PORT}"
  echo "   Run: cd /Users/computer/code/colors-backend && ./docs/paperclip-setup/run-paperclip-with-agent.sh"
  exit 1
fi
echo "✅ Paperclip running on port ${PAPERCLIP_PORT}"

# 2. Get ngrok public URL
NGROK_URL=$(curl -sf "$NGROK_API" 2>/dev/null | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['tunnels'][0]['public_url'])" 2>/dev/null || true)
if [[ -z "$NGROK_URL" ]]; then
  echo "❌ ngrok not running or not accessible"
  echo "   Run: ngrok http ${PAPERCLIP_PORT}"
  exit 1
fi
echo "✅ ngrok URL: $NGROK_URL"

# Verify ngrok targets the right port
NGROK_TARGET_PORT=$(curl -sf "$NGROK_API" | python3 -c "import sys,json; d=json.load(sys.stdin); addr=d['tunnels'][0]['config']['addr']; print(addr.split(':')[-1])" 2>/dev/null || true)
if [[ "$NGROK_TARGET_PORT" != "$PAPERCLIP_PORT" ]]; then
  echo "⚠️  ngrok targets port $NGROK_TARGET_PORT but Paperclip is on $PAPERCLIP_PORT"
  echo "   Stop ngrok (Ctrl+C) and restart: ngrok http $PAPERCLIP_PORT"
  exit 1
fi

# 3. Extract hostname and add to allowed list
NGROK_HOST=$(echo "$NGROK_URL" | sed 's|https://||')
echo "   Adding hostname: $NGROK_HOST"
npx --yes paperclipai allowed-hostname "$NGROK_HOST" 2>/dev/null || true
echo "✅ Hostname added to allowed list"

# 4. Verify external access
HTTP_CODE=$(curl -sf -o /dev/null -w "%{http_code}" "${NGROK_URL}/api/health" 2>/dev/null || echo "000")
if [[ "$HTTP_CODE" == "200" ]]; then
  echo "✅ External access works"
else
  echo "⚠️  External access returned HTTP $HTTP_CODE (may need ngrok browser confirmation)"
fi

echo ""
echo "=== הוראות לשקד ==="
echo ""
echo "שלח לשקד את ההודעה הבאה:"
echo ""
echo "---"
echo "שלום שקד!"
echo ""
echo "כדי להתחבר ל-Paperclip:"
echo ""
echo "1. התקן את ה-CLI:"
echo "   npm install -g paperclipai"
echo ""
echo "2. הגדר context:"
echo "   npx paperclipai context set --api-base ${NGROK_URL}"
echo ""
echo "3. התחבר:"
echo "   npx paperclipai auth login --api-base ${NGROK_URL}"
echo ""
echo "4. בדוק חיבור:"
echo "   npx paperclipai dashboard get -C d59b9eb3-ecca-4d4b-9846-b758173969b7 --api-base ${NGROK_URL}"
echo ""
echo "5. ב-Cursor, הגדר את Paperclip gateway:"
echo "   ${NGROK_URL}"
echo "---"
echo ""
echo "=== Done ==="
