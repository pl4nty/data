-- Threat: !InfrastructureShared
-- Name: c378f2c08941
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
