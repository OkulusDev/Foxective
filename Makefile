PYTHON := python3
PIP := pip3
REQFILE := requirements.txt
MODULES_DIR := modules

install:
	$(PIP) install -r $(REQFILE)

freeze:
	$(PIP) freeze > $(REQFILE)
