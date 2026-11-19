-- Threat: !InfrastructureShared
-- Name: 39788564df13
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
