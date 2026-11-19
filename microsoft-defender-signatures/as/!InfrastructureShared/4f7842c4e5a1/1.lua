-- Threat: !InfrastructureShared
-- Name: 4f7842c4e5a1
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
