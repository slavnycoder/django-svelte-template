from backend import settings

broker_url = settings.REDIS_URL

timezone = settings.TIME_ZONE
enable_utc = True

beat_scheduler = "common.utils:DatabaseSchedulerWithCleanup"
task_ignore_result = True

imports = []
task_routes = {}
beat_schedule = {}
