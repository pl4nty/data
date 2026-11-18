-- Threat: !InfrastructureShared
-- Name: 3d78f074a9ab
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
