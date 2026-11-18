-- Threat: !InfrastructureShared
-- Name: 3729129e5e26
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "androidmanifest", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
