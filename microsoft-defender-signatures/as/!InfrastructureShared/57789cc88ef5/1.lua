-- Threat: !InfrastructureShared
-- Name: 57789cc88ef5
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
