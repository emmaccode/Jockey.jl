module JockeyEditor
using Interact
function home_page()
    img = HTML(string("<img src = '../../assets/jockey500x500.png'></img>"))
    loadbutton = filepicker()
    openbutton = button("Open Notebook")
    newbutton = button("New Notebook")
    ui = vbox( # put things one on top of the other
    hbox(img),
        pad(5em, hbox( # put things one next to the other
        pad(1em, loadbutton),
            pad(1em, openbutton) # to allow some white space around the widget

        )
        ),
        pad(1em, newbutton),
    )
    return(ui)
end
export home_page
end # module
