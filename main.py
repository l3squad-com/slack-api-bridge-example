from fastapi import FastAPI
from api_bridge import APIBridge

# Single database configuration
db_config = {
    "host": "localhost",
    "port": 3306,
    "database": "slack_db",
    "user": "root",
    "password": "1234"
}

app = FastAPI(
    title="Slack"
)

api_bridge = APIBridge(db_config,base_endpoint="/slack-apis")
app.include_router(api_bridge.router)

# Run the app
# uvicorn main:app --reload
