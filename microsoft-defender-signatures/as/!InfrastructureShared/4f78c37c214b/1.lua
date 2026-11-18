-- Threat: !InfrastructureShared
-- Name: 4f78c37c214b
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
