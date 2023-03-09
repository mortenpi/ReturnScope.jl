module ReturnScope

export @returnscope

macro returnscope(ex)
    (ex.head == :block) || throw(ArgumentError("@returnscope must be applied on an begin ... end block"))
    quote
        (() -> $(esc(ex)))()
    end
end

end
