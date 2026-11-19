-- Threat: !InfrastructureShared
-- Name: 3d7800c406d1
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
