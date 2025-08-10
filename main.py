from fastapi import FastAPI
from pydantic import BaseModel
import uvicorn


app = FastAPI()


class Child(BaseModel):
    name: str
    surname: str
    age: int


@app.post("/create")
def create_test(request: Child) -> Child:
    """Here we create a new child"""
    return request


@app.get("/")
def root():
    return {"message": "This is a testing rep"}


def main():
    uvicorn.run(
        app=app,
        host="localhost",
        port=8000,
    )


if __name__ == "__main__":
    main()
