-- Threat: !InfrastructureShared
-- Name: 3b78b42c479d
-- Type: 21

if peattributes.ismsil and peattributes.amd64_image and peattributes.requests_elevation then
  return mp.INFECTED
end
return mp.CLEAN
