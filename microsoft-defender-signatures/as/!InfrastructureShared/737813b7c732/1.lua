-- Threat: !InfrastructureShared
-- Name: 737813b7c732
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
