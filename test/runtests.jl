using ReturnScope
using Test

function test1(x)
    y = @returnscope begin
        x % 2 == 0 && return true
        return false
    end
    return (x, y)
end

function test2(x)
    y = nothing
    @returnscope begin
        x = x + 1
        y = x
        z = x
        nothing
    end
    z_or_missing = try
        z
    catch e
        isa(e, UndefVarError) || rethrow(e)
        missing
    end
    return x, y, z_or_missing
end

@testset "ReturnScope.jl" begin
    @test test1(0) === (0, true)
    @test test1(1) === (1, false)
    @test test1(2) === (2, true)
    @test test1(3) === (3, false)

    @test test2(1) === (2, 2, missing)
    @test test2(41) === (42, 42, missing)
end
