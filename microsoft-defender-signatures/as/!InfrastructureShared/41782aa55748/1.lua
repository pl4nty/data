-- Threat: !InfrastructureShared
-- Name: 41782aa55748
-- Type: 21

if peattributes.isdll and peattributes.x86_image and peattributes.suspicious_linker_version then
  return mp.INFECTED
end
return mp.CLEAN
