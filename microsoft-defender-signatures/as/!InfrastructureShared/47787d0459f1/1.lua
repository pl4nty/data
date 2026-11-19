-- Threat: !InfrastructureShared
-- Name: 47787d0459f1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
