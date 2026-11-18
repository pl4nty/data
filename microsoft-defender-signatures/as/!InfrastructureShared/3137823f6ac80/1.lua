-- Threat: !InfrastructureShared
-- Name: 3137823f6ac80
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
