# Leetcode x86_64 ASM
Solving LeetCode-style problems in x86_64 assembly.   
This uses the [Criterion](https://github.com/Snaipe/Criterion) unit testing framework.

### Build on Linux
#### Requirements
- `build-essential`
- `make`

#### Run tests
```
make test
```

#### Clean build files
```
make clean
```

<br>
<br>

### Build with Docker
#### Build image
```
docker build -t leetcode-x86_64-asm:1 .
```

#### Run container
```
docker run -it --rm leetcode-x86_64-asm
```

