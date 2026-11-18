-- Threat: !InfrastructureShared
-- Name: 8a78d99317ad
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
