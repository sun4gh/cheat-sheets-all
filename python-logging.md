```python
import logging

# Create a formatter: controls how each log line looks
formatter = logging.Formatter(
	"%(asctime)s %(levelname)s %(name)s: %(message)s"
)

# Create a handler: sends logs to the console
handler = logging.StreamHandler()
handler.setLevel(logging.INFO)
handler.setFormatter(formatter)

# Create/get a logger
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

# Attach the handler to the logger
logger.addHandler(handler)

# Optional: prevent messages from also bubbling up to parent loggers
logger.propagate = False

# Emit some messages
logger.debug("Detailed info")
logger.info("Program started")
logger.warning("Something looks odd")
logger.error("Something failed (but program can continue)")
logger.critical("System is unusable") # not used often
```

What they do:
- Logger → creates log records
- Handler → decides where they go
- Formatter → decides how they look
- setLevel() → filters messages below that severity
