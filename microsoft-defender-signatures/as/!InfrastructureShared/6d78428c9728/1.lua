-- Threat: !InfrastructureShared
-- Name: 6d78428c9728
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
