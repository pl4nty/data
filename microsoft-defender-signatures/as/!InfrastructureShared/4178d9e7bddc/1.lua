-- Threat: !InfrastructureShared
-- Name: 4178d9e7bddc
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
