# ReturnScope

[![Build Status](https://github.com/mortenpi/ReturnScope.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/mortenpi/ReturnScope.jl/actions/workflows/CI.yml?query=branch%3Amain)

```julia
using ReturnScope

function returnscope_example(x)
    y = @returnscope begin
        x % 2 == 0 && return true
        return false
    end
    (x, y)
end
```

```julia-repl
julia> returnscope_example(1)
(1, false)

julia> returnscope_example(2)
(2, true)
```
