-- Threat: !InfrastructureShared
-- Name: 1989c3bbaab1
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.suspicious_image_version then
  return mp.CLEAN
end
return mp.INFECTED
