import asyncio
from prefect import flow, serve


@flow
async def slow_flow(sleep: int = 60):
    "Sleepy flow - sleeps the provided amount of time (in seconds)."
    await asyncio.sleep(sleep)


@flow
def fast_flow():
    "Fastest flow this side of the Mississippi."
    return


if __name__ == "__main__":
    slow_deploy = slow_flow.to_deployment(name="sleeper", interval=45)
    fast_deploy = fast_flow.to_deployment(name="fast", interval=30)
    serve(slow_deploy, fast_deploy, limit=10, pause_on_shutdown=True)
