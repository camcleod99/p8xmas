-- Message
-- Manages the creation and display of messages
-- V1

function initMessage()
    messagetable = {}
    messagefrm = 0
    messagetime = 0
end

function addMessage(input_text,inputspeed,inputcolors,input_x,input_y)
    add(messagetable, {
        text=input_text,
        speed=inputspeed,
        time=0,
        colors=inputcolors,
        base_x=input_x,
        last_x=0,
        coord_y=input_y,
        last_x=0,
    })
    for m in all (messagetable) do
        if m.last_x == 0 then
            m.last_x = #m.text*4
        end
    end
end

function updateMessage()
    for m in all(messagetable) do
        m.time += m.speed
        if (m.base_x + m.last_x - m.time) < 0 then
            m.time = 0
        end
    end
end

function drawMessage()
    for m in all(messagetable) do
        for t = 1, #m.text, 1 do
            letter = sub(m.text, t, t)
            print(letter, (m.base_x + t*4) - m.time , m.coord_y, 5)
        end
    end
end