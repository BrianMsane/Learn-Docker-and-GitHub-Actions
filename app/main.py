from fastapi import FastAPI

app = FastAPI()

@app.get('/')
async def root():
    return {'message': "👋"}

@app.get('/dev')
async def main():
    return {'message': 'suppose this is the main endpoint 😂'}
