-- Threat: !InfrastructureShared
-- Name: ad7818cd60b9
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
