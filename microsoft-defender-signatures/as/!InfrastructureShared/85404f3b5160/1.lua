-- Threat: !InfrastructureShared
-- Name: 85404f3b5160
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignatur") or peattributes.isexe == false then
  return mp.CLEAN
end
return mp.INFECTED
