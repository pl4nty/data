-- Threat: !InfrastructureShared
-- Name: 2d78d8f2e343
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
