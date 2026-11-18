-- Threat: !InfrastructureShared
-- Name: c2b38d6a3735
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  local l_0_1 = string.lower(l_0_0.command_line)
  if l_0_1:find("gpsvc", 1, true) or l_0_1:find("schedule", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
