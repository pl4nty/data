-- Threat: !InfrastructureShared
-- Name: 62785972d28c
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.suspicious_image_version then
  return mp.CLEAN
end
if not peattributes.executes_from_dynamic_memory then
  return mp.CLEAN
end
return mp.INFECTED
