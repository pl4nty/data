-- Threat: !InfrastructureShared
-- Name: 1a29b2153c32
-- Type: 21

local l_0_0 = mp.getfilename()
l_0_0 = l_0_0.lower(l_0_0)
if string.find(l_0_0, ".py", 1, true) or string.find(l_0_0, ".ps1", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
