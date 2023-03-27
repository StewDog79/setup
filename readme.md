## Useful Stuff and Machine Setup Tips and Scripts

## Machine Setup
1. Install Ubuntu or distro of choice onto Windows
2. Install WSL
3. Install vs-code.sh to setup extensions
4. Run "ununtu.sh" config scripts

## Run config script vs run manually
Can be run as a script

In bash terminal make install script executable (`chmod +x install.sh`), then run as superuser with

```bash
sudo ./ubuntu.sh
```
But in many ways it makes sense to just run the commands 1 by 1.

## AWS Profile/Environment
We have AWS variables setup in aws/.aws - but when we start to code we need to confirm the environment we are working with, by running these commands:

```bash
export AWS_PROFILE=PROFILE NAME
export AWS_REGION=CHOSE ME
export AWS_DEFAULT_REGION=eu-west-2
```
## Setup for Python
Make a virtual environment and open it

```bash
#------FOR LINUX/MAC---------#
#installing venv (replace the "3.6" with the python version)
sudo apt-get install python3.6-venv
#creating virtual env
python3 -m venv venv
#activating virtual env
source venv/bin/activate
```
```powershell
#-------FOR WINDOWS----------#
#installing venv
py -m pip install --user virtualenv
#creating virtual env
py -m venv venv
#activating virtual env
.\venv\Scripts\activate
```

Install the project and its dependencies
```bash
pip install -r requirements.txt
```

If you wanna use dev tools (e.g. pytest, flake8, mypy, black, tox, etc.), install dev tools using
```bash
pip install -r requirements_dev.txt
```