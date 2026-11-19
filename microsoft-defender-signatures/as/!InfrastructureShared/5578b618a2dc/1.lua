-- Threat: !InfrastructureShared
-- Name: 5578b618a2dc
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
