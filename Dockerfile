# Start from the official Kali Linux rolling image
FROM kalilinux/kali-rolling

# Set environment variables to allow non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install Kali Linux everything, plus RDP tools
# This is a large download and will take a while
RUN apt-get update && apt-get install -y \
    kali-linux-default \
    xfce4 \
    xrdp \
    --no-install-recommends

# Configure XRDP to use XFCE
RUN echo "xfce4-session" > /etc/skel/.xsession

# Set a default password for the 'root' user.
# IMPORTANT: Change 'your-password' to a secure password of your choice!
RUN echo 'root:your-password' | chpasswd

# Expose the RDP port
EXPOSE 3389

# Default command to run when the container starts
CMD ["/usr/sbin/xrdp", "-n"]
