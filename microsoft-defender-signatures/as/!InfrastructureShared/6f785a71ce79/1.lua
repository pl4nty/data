-- Threat: !InfrastructureShared
-- Name: 6f785a71ce79
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
