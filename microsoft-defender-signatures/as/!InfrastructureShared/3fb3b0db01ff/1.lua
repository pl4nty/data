-- Threat: !InfrastructureShared
-- Name: 3fb3b0db01ff
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if l_0_1 then
  l_0_1 = string.lower(l_0_1)
  if string.find(l_0_1, ".msi", 1, true) then
    return mp.CLEAN
  end
  if string.find(l_0_1, "http://", 1, true) or string.find(l_0_1, "https://", 1, true) then
    local l_0_2, l_0_3 = string.gsub(l_0_1, "\t", "")
    local l_0_4, l_0_5 = string.gsub(l_0_1, "=", "")
    local l_0_6, l_0_7 = string.gsub(l_0_1, " ", "")
    local l_0_8, l_0_9 = string.gsub(l_0_1, " %w+=%w+", "")
    if 10 <= l_0_3 and 1 <= l_0_5 then
      return mp.INFECTED
    end
    if string.find(l_0_1, " -q", 1, true) or string.find(l_0_1, " /q", 1, true) then
      if 20 <= l_0_7 and 4 <= l_0_5 then
        return mp.INFECTED
      end
      if 4 <= l_0_9 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
