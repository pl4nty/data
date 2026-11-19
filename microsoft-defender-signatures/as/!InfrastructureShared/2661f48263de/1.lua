-- Threat: !InfrastructureShared
-- Name: 2661f48263de
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
