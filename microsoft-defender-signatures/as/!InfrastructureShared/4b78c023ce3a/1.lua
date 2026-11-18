-- Threat: !InfrastructureShared
-- Name: 4b78c023ce3a
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
