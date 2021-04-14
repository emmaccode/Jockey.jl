using Pkg
include("JockeyEditor.jl")
function parse_bash_command(s)
    dims = split(s, " ")
    command = dims[1]
    if length(dims) != 1
        param = dims[2]
    end
    if command == "cd"
        cd(param)
    elseif command == "ls"
        readdir();
    elseif command == "pwd"
        pwd()
    elseif command == "rmdir"
        rmdir(param)
    elseif command == "mkdir"
        mkdir(param)
    elseif command == "source"
        Pkg.activate(param)
    else
        try
            run(Cmd(s))
        catch
            println("Could not determine command")
        end
    end
end

function install()
    Pkg.add("ReplMaker")
    home = homedir()
    startup = string(home, "/.julia/config/startup.jl")
    try
        touch(startup)
    catch
        mkdir(string(home,"/.julia/config"))
        touch(startup)
    end
    open(startup, "w") do io
        write(io, "# ========================\n")
        write(io, "#   Jockey Installation\n")
        write(io, "# ========================\n")
        write(io, "\n")
           write(io, "using Jockey\n")
           write(io, "using ReplMaker\n")
           write(io, "atreplinit() do repl\n")
               write(io, "try\n")
               write(io, "@eval using ReplMaker\n")
               write(io, "@async initrepl(\n")
               write(io, "parse_bash_command;\n")
               write(io, "prompt_text=\"jockey> \",\n")
               write(io, "prompt_color = :cyan,\n")
               write(io, "start_key = '[',\n")
               write(io, "mode_name = \"Jockey\");")
               write(io, "catch\n end\n end\n")

    end;

end
