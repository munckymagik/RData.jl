module TestErrors
  using RData, Test

  @testset "CodecMissingError implements showerror" begin
    io = IOBuffer()
    showerror(io, CodecMissingError(:Xz))
    msg = String(take!(io))

    @test startswith(msg, "CodecMissingError: CodecXz package is required")
  end
end
