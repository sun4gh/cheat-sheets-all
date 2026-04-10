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
- Handler → sends logs somewhere and filters by level
- Formatter → decides how they look
- setLevel() → filters messages below that severity (both logger and handler apply)

---

Given source code:
```text
mylib/
└── src/
    └── mylib/
        ├── helper1.py
        └── helper2.py
```

and
```python
# inside helper1.py / helper2.py
logger = logging.getLogger(__name__)
```

Loggers created are typically:
```text
mylib.helper1
mylib.helper2
```

Hierarchy of Loggers:
```text
root
└── mylib
    ├── mylib.helper1
    └── mylib.helper2
```

Hierarchy provides grouped control:

- Set level for entire package:
```python
logging.getLogger("mylib").setLevel(logging.INFO)
```

- Override one noisy module:
```python
logging.getLogger("mylib.helper2").setLevel(logging.ERROR)
```
- Attach a handler at `mylib` → can affect all children (if propagation is enabled)
- Leave rest of app unaffected (when configuring only `mylib`, not root)
- override only where needed

Consider:
```python
# configure only
logging.getLogger("mylib").setLevel(logging.INFO)

# reuse if needed
pkg_logger = logging.getLogger("mylib")
pkg_logger.setLevel(logging.INFO)
```
