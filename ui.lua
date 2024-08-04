udbrui = udbrui or {}
udbrui.elements = udbrui.elements or {}
udbrui.lib = udbrui.lib or {}
udbrui.lib.colors = udbrui.lib.colors or {}

function udbrui.lib:scale(n1, n2, n3, n4)
    if (n1 and n2 and n3 and n4) then
        return n1*(ScrH()/1080),n2*(ScrH()/1080),n3*(ScrH()/1080),n4*(ScrH()/1080) 
    end

    if (n1 and n2 and n3) then
        return n1*(ScrH()/1080),n2*(ScrH()/1080),n3*(ScrH()/1080) 
    end

    if (n1 and n2) then
        return n1*(ScrH()/1080),n2*(ScrH()/1080) 
    end

    if (n1) then
        return n1*(ScrH()/1080)
    end
end

function udbrui.lib:color(c)
    if (udbrui.lib.colors[c.r..c.g..c.b]) then
        return udbrui.lib.colors[c.r..c.g..c.b]
    end

    if not (udbrui.lib.colors[c.r..c.g..c.b]) then
        udbrui.lib.colors[c.r..c.g..c.b] = table.Copy(c)
        return udbrui.lib.colors[c.r..c.g..c.b]
    end
end

for i = 10, 80 do
    surface.CreateFont("udbruifont"..i, {
        font = "Roboto Medium",
        size = mnulib:scale(i),
    })

    surface.CreateFont("udbruifontb"..i, {
        font = "Roboto Medium",
        size = mnulib:scale(i),
        weight = 400,
    })

    surface.CreateFont("udbruifontbb"..i, {
        font = "Roboto Medium",
        size = mnulib:scale(i),
        weight = 600,
    })
end

hook.Add("OnScreenSizeChanged", "mnulib_scrchange", function()
    for i = 10, 80 do
        surface.CreateFont("udbruifont"..i, {
            font = "Roboto Medium",
            size = mnulib:scale(i),
        })
    
        surface.CreateFont("udbruifontb"..i, {
            font = "Roboto Medium",
            size = mnulib:scale(i),
            weight = 400,
        })
    
        surface.CreateFont("udbruifontbb"..i, {
            font = "Roboto Medium",
            size = mnulib:scale(i),
            weight = 600,
        })
    end
end)

local PANEL = {}

function PANEL:Paint(w, h)
    draw.RoundedBox(udbrui.lib:scale(18), 0, 0, w, h, udbrui.lib:color(Color(106,16,18)))
end

vgui.Register("udbrui.frame", PANEL, "DPanel")
