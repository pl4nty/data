-- Threat: !InfrastructureShared
-- Name: 3f7805bc2e67
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.suspicious_image_version then
  return mp.CLEAN
end
return mp.INFECTED
