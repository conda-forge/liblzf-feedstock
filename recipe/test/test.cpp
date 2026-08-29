#include <liblzf/lzf.h>

#include <array>
#include <cstring>

int main() {
  std::array<char, 1024> input{};
  input.fill('a');

  std::array<unsigned char, 2048> compressed{};
  const auto compressed_size = lzf_compress(
      input.data(), input.size(), compressed.data(), compressed.size());
  if (compressed_size == 0) {
    return 1;
  }

  std::array<char, 1024> output{};
  const auto output_size = lzf_decompress(
      compressed.data(), compressed_size, output.data(), output.size());
  return output_size == input.size() && output == input ? 0 : 1;
}
