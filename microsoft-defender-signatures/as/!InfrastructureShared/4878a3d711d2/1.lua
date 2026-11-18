-- Threat: !InfrastructureShared
-- Name: 4878a3d711d2
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
