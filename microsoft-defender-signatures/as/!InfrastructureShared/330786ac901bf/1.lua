-- Threat: !InfrastructureShared
-- Name: 330786ac901bf
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
