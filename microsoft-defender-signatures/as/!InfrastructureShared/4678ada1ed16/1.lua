-- Threat: !InfrastructureShared
-- Name: 4678ada1ed16
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
