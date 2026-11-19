-- Threat: !InfrastructureShared
-- Name: 75402c1b3d20
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignatur") or peattributes.isexe == false then
  return mp.CLEAN
end
return mp.INFECTED
