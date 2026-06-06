FROM whalswo/team15_project:0.1.0

RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:ubuntu-toolchain-r/test -y \
    && apt-get update && apt-get install -y \
    novnc \
    websockify \
    python3 \
    cmake \
    git \
    build-essential \
    gcc-13 \
    g++-13 \
    libstdc++6 \
    libfreetype6-dev \
    libudev-dev \
    libopenal-dev \
    libvorbis-dev \
    libflac-dev \
    libxrandr-dev \
    libxcursor-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --branch 2.6.1 https://github.com/SFML/SFML.git /tmp/sfml && \
    cmake -S /tmp/sfml -B /tmp/sfml/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DCMAKE_CXX_COMPILER=g++-13 && \
    cmake --build /tmp/sfml/build -j$(nproc) && \
    cmake --install /tmp/sfml/build && \
    ldconfig && \
    rm -rf /tmp/sfml
