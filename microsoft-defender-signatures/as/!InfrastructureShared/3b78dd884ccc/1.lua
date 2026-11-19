-- Threat: !InfrastructureShared
-- Name: 3b78dd884ccc
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
