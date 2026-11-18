-- Threat: !InfrastructureShared
-- Name: 7a7821d5e1f0
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
