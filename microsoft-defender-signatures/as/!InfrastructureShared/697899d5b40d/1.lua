-- Threat: !InfrastructureShared
-- Name: 697899d5b40d
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.x86_image then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
return mp.INFECTED
