include("server/server.jl")
include("editor/JockeyEditor.jl")
module Jockey
using Main.JockeyServer: webserver
using Main.JockeyEditor
using Interact
function run()
    ui = home_page()
    server = webserver(ui, 8000)
end
end
