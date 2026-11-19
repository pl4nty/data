-- Threat: !InfrastructureShared
-- Name: 86783cf4bb8b
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
