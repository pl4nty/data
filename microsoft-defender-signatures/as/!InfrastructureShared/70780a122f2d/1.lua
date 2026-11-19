-- Threat: !InfrastructureShared
-- Name: 70780a122f2d
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
