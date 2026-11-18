-- Threat: !InfrastructureShared
-- Name: 547865f38301
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
