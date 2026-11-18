-- Threat: !InfrastructureShared
-- Name: 66780a99b5eb
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
