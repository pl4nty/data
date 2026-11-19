-- Threat: !InfrastructureShared
-- Name: 4d78362b99a6
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
