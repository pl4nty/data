-- Threat: !InfrastructureShared
-- Name: 2c89fc66bf12
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.suspicious_image_version then
  return mp.CLEAN
end
return mp.INFECTED
