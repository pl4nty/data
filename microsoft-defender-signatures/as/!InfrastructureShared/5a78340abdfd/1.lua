-- Threat: !InfrastructureShared
-- Name: 5a78340abdfd
-- Type: 21

if peattributes.suspicious_timestamp or peattributes.suspicious_image_version or peattributes.suspicious_linker_version then
  return mp.INFECTED
end
return mp.CLEAN
