-- Threat: !InfrastructureShared
-- Name: 3561b00dd16d
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
