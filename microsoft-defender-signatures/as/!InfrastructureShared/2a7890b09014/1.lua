-- Threat: !InfrastructureShared
-- Name: 2a7890b09014
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
