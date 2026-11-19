-- Threat: !InfrastructureShared
-- Name: 142984a72579
-- Type: 21

local l_0_0 = mp.GetLnkInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0.Arguments:lower(), "comspec", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
