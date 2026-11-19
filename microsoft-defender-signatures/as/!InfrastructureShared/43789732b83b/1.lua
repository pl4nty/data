-- Threat: !InfrastructureShared
-- Name: 43789732b83b
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
