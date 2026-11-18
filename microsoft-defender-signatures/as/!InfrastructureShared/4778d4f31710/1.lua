-- Threat: !InfrastructureShared
-- Name: 4778d4f31710
-- Type: 21

if not peattributes.amd64_image then
  return mp.CLEAN
end
if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
return mp.INFECTED
