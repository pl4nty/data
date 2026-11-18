-- Threat: !InfrastructureShared
-- Name: c5405ab7841d
-- Type: 21

if peattributes.no_security == true and mp.get_mpattribute("NID:Win32/LockCrypt.PA!Pra1") then
  return mp.INFECTED
end
return mp.CLEAN
