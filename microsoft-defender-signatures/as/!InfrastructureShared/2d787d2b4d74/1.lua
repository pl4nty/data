-- Threat: !InfrastructureShared
-- Name: 2d787d2b4d74
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
