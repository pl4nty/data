-- Threat: !InfrastructureShared
-- Name: 397843c3ba64
-- Type: 21

local l_0_0 = mp.getfilename()
if not l_0_0 then
  return mp.CLEAN
end
if string.find(l_0_0:lower(), "decrypt", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
