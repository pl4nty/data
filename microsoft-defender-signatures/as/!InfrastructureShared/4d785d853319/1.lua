-- Threat: !InfrastructureShared
-- Name: 4d785d853319
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
