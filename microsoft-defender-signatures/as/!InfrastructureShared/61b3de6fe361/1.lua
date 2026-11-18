-- Threat: !InfrastructureShared
-- Name: 61b3de6fe361
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  local l_0_1 = string.lower(l_0_0.command_line)
  if l_0_1:find("azurearcagent", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
