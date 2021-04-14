<div align="center"><img src="https://github.com/ChifiSource/Jockey.jl/blob/main/assets/jockey500x500.png" />
  <h1>0.1.0</h1>
</div>
<div align="left">
  <p> Jockey.jl is an enhanced work environment for computer operations tied into the Julia programming language. It features an enhanced REPL that interprets bash commands into Julia code, as well as a fully-featured in-REPL IDE (soon to come.)</p>
        </div>
        
        
# Installation
You can install Jockey.jl pretty easily, but there are some prerequisites to note before installing.
- Jockey.jl must be added into your GLOBAL Julia environment
- Your Julia user files must be located in ~/.julia or Users/USERNAME/.julia
```julia
using Pkg
Pkg.add("Jockey")
using Jockey
Jockey.install()
```
# Usage
Jockey.jl all starts with a REPL. The REPL can easily be accessed from within the Julia REPL like so:
```bash
julia> [

jockey> 
```
From this REPL, we can use basic bash commands with single arguments provided -- this will be taken further in future versions, of course, but for the initial release, we have the following BASH commands:
- cd: Change directory, use this to move the working directory of both Jockey and Julia.
- ls: List the directories in the current working directory
- pwd: Push the current working directory
- rmdir: Remove directory
- mkdir: Make directory
- source: Activate a Pkg virtual environment
