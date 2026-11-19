-- Threat: !InfrastructureShared
-- Name: 25401dd65c96
-- Type: 21

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if string.find(l_0_0:lower(), "\\teams.exe") then
  return mp.CLEAN
end
return mp.INFECTED
