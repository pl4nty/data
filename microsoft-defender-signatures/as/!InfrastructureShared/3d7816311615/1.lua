-- Threat: !InfrastructureShared
-- Name: 3d7816311615
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
