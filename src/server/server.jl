module JockeyServer
using Interact, Mux, WebIO
using Base.Threads: @spawn
mutable struct webserver{Nav}
    running::Bool
    port::Int64
    navigate::Nav
    function webserver(ui, port)
        running = true
        try
            WebIO.webio_serve(page("/", req -> ui), port)
            @info "Jockey Server started at http://localhost:8000"
        catch
            running = false
            @info "Jockey Server FAILED to instantiate!"
        end
        navigate(ui) = WebIO.webio_serve(page("/", req -> ui), port)
        new{typeof(navigate)}(running, port, navigate)
    end
end
function check_activity()

end
export webserver
end # module
