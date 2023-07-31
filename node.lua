util.no_globals()

--gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)
gl.setup(1024, 768)

local base_time = N.base_time or 0
local base_date = N.base_date or ""
local base_dow = N.base_dow or ""
local base_doe = N.base_doe or ""

node.alias "cert-clock"

util.data_mapper{
    ["time/set"] = function(new_time)
        base_time = tonumber(new_time) - sys.now()
        N.base_time = base_time
    end;
    ["date/set"] = function(new_date)
        base_date = new_date
        N.base_date = base_date
    end;
    ["dow/set"] = function(new_dow)
        base_dow = new_dow
        N.base_dow = base_dow
    end;
    ["doe/set"] = function(new_doe)
        base_doe = new_doe
        N.base_doe = base_doe
    end;
}

local font = resource.load_font "DejaVuSansMono-Bold.ttf"

function node.render()
    gl.clear(0,0,0,1)
    gl.scale(1, 1)

    if base_time == 0 then
        font:write(0, 20, string.format("%5d", sys.now()), 120, 1, 0, 0, 1)
        return
    end

    local time = base_time + sys.now()

    local seconds = time % 60
    local minutes = (time - seconds) % 3600 / 60
    local hours = ((time - seconds) / 3600) % 24

    local line = string.format("%02d:%02d:%02d", hours, minutes, seconds)
    local halfwidth = font:width(line, 210) / 2
    font:write(512 - halfwidth, 10, line, 210, 1, 0, 0, 1)

    halfwidth = font:width(base_date, 165) / 2
    font:write(512 - halfwidth, 210, base_date, 165, 1, 0, 0, 1)

    halfwidth = font:width(base_dow, 80) / 2
    font:write(512 - halfwidth, 380, base_dow, 80, 1, 0, 0, 1)

    halfwidth = font:width(base_doe, 120) / 2
    font:write(512 - halfwidth, 475, base_doe, 120, 1, 0, 0, 1)
end
