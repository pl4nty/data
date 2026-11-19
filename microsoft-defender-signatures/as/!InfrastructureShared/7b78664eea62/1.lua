-- Threat: !InfrastructureShared
-- Name: 7b78664eea62
-- Type: 21

if peattributes.suspicious_image_version and peattributes.hasappendeddata and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
