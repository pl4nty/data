-- Threat: !InfrastructureShared
-- Name: 5578dbe785d1
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
