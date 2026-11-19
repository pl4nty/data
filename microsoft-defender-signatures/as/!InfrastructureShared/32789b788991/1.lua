-- Threat: !InfrastructureShared
-- Name: 32789b788991
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
