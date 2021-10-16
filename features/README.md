# Cucumber

To run cucumber tests,

```
cucumber
```

You need to be in a GUI environement for the default configuration to work properly.

For headless,

Install chromedriver and make sure it is in PATH.

https://chromedriver.storage.googleapis.com/94.0.4606.61/chromedriver_linux64.zip

```
sudo apt-get install unzip;
wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/94.0.4606.61/chromedriver_linux64.zip && sudo unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/;
```

Also, install chrome:

```
sudo apt-get update
sudo apt-get install -y libappindicator1 fonts-liberation
cd temp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
```
