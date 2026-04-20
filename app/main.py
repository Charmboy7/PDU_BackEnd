from fastapi import FastAPI
from app.routes.options_routes import router as options_router

app = FastAPI(title="Hyper PDU Configurator API")

app.include_router(options_router, prefix="/options")

@app.get("/health", tags=["health"])
async def health_check():
    return {"status": "OK"}
