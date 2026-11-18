-- Threat: !InfrastructureShared
-- Name: 53d7f008bc12
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0.ppid))
  if l_0_1:find("\\program files\\", 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
