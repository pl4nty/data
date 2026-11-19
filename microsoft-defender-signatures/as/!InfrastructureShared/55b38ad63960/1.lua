-- Threat: !InfrastructureShared
-- Name: 55b38ad63960
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if l_0_1 then
  l_0_1 = string.gsub(l_0_1, "\"", "")
  l_0_1 = string.gsub(l_0_1, "'", "")
  l_0_1 = string.lower(l_0_1)
  if string.find(l_0_1, "http.- # ") or string.find(l_0_1, " \226[\128-\191][\128-\191] ") or string.find(l_0_1, " \240[\128-\191][\128-\191][\128-\191] ") then
    return mp.INFECTED
  end
end
return mp.CLEAN
