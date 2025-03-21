# dr_wav
This is [dr_wav from dr_libs](https://github.com/mackron/dr_libs), packaged for [Zig](https://ziglang.org/). (Intended for C or C++ projects using Zig as a build tool.)

## Usage
First, update your `build.zig.zon`:
```sh
zig fetch --save git+https://github.com/jessechounard/dr_wav
```

Next, in your `build.zig`, you can access the library as a dependency:
```zig
const dr_wav_dep = b.dependency("dr_wav", .{
    .target = target,
    .optimize = optimize,
});
const dr_wav_lib = dr_wav_dep.artifact("dr_wav");

exe.root_module.linkLibrary(dr_wav_lib);
```

Finally, in your C++ file, you can use the library:
```cpp
#include <dr_wav.h>
#include <stdio.h>

int main() {
  drwav wav;
  if (!drwav_init_file(&wav, "song.wav", NULL)) {
    // Error opening WAV file.
  }
  return 0;
}```
