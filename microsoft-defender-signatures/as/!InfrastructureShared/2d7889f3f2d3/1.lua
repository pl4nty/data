-- Threat: !InfrastructureShared
-- Name: 2d7889f3f2d3
-- Type: 21

if peattributes.x86_image and peattributes.suspicious_dosheader then
  return mp.INFECTED
end
return mp.CLEAN
