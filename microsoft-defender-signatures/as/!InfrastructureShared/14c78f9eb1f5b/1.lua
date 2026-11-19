-- Threat: !InfrastructureShared
-- Name: 14c78f9eb1f5b
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
