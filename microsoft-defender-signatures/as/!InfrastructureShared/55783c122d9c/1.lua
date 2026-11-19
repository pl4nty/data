-- Threat: !InfrastructureShared
-- Name: 55783c122d9c
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
