FROM ubuntu:latest

# Install necessary software
RUN apt-get update && \
    apt-get -y install cron && \
    apt-get -y install curl

# Add crontab file
COPY crontab /etc/cron.d/crontab

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/crontab

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Start the cron service
CMD cron && tail -f /var/log/cron.log
