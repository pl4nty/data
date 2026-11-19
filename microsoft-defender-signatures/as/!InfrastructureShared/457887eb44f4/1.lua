-- Threat: !InfrastructureShared
-- Name: 457887eb44f4
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
