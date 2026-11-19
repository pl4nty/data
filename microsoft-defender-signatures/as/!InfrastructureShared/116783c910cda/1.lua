-- Threat: !InfrastructureShared
-- Name: 116783c910cda
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
