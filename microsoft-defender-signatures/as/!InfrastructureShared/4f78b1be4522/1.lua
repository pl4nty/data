-- Threat: !InfrastructureShared
-- Name: 4f78b1be4522
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
