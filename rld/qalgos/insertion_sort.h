#pragma once

#include <algorithm>

namespace rld {
namespace algos {

/// element which is going to be inserted is at the past the end position
/// upper_bound returns destination for this element
/// insertion is done by rotate left
template <class ForwardIt> void insertion_sort(ForwardIt f, ForwardIt e) {
  auto const s = f;
  for (; f != e; ++f) {
    std::rotate(std::upper_bound(s, f, *f), f, next(f));
  }
}

} // namespace algos
} // namespace rld
