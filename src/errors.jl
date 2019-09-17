abstract type RDataException <: Exception end

struct CodecMissingError <: RDataException
    msg::AbstractString

    CodecMissingError(formatName) = new(string(
      "Codec$formatName package is required to read $formatName-compressed RData files. ",
      "Run Pkg.add(\"Codec$formatName\") to install it. Then in your code call ",
      "\"using Codec$formatName\" before \"using RData\"."
    ))
end

Base.showerror(io::IO, e::CodecMissingError) = print(io, "CodecMissingError: $(e.msg)")
