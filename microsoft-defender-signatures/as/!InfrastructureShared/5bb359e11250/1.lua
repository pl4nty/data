-- Threat: !InfrastructureShared
-- Name: 5bb359e11250
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
local l_0_2 = string.lower(mp.GetProcessCommandLine(l_0_1))
if string.find(l_0_2, "8223363f%-34f3%-4cff%-b4f2%-6d0d4b9a4dbc") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
