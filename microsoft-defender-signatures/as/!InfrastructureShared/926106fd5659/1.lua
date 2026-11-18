-- Threat: !InfrastructureShared
-- Name: 926106fd5659
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
