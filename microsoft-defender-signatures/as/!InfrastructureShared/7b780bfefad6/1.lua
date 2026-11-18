-- Threat: !InfrastructureShared
-- Name: 7b780bfefad6
-- Type: 21

if peattributes.suspicious_timestamp or peattributes.suspicious_image_version or peattributes.suspicious_linker_version then
  return mp.INFECTED
end
return mp.CLEAN
