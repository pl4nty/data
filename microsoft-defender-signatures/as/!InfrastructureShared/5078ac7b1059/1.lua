-- Threat: !InfrastructureShared
-- Name: 5078ac7b1059
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
