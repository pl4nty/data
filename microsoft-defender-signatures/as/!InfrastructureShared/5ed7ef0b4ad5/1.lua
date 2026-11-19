-- Threat: !InfrastructureShared
-- Name: 5ed7ef0b4ad5
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
  if string.find(l_0_1, " --headless ", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
