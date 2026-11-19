-- Threat: !InfrastructureShared
-- Name: 5a7808383d71
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.suspicious_image_version and not peattributes.suspicious_timestamp then
  return mp.CLEAN
end
return mp.INFECTED
