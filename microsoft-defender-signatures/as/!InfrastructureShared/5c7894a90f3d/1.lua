-- Threat: !InfrastructureShared
-- Name: 5c7894a90f3d
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
