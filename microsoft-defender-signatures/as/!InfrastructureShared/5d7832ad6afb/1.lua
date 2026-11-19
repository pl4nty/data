-- Threat: !InfrastructureShared
-- Name: 5d7832ad6afb
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
