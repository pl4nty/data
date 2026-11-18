-- Threat: !InfrastructureShared
-- Name: 7078dd2d0a7a
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
