-- Threat: !InfrastructureShared
-- Name: 4b781ce3b41d
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
