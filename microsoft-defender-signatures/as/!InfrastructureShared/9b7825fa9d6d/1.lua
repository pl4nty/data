-- Threat: !InfrastructureShared
-- Name: 9b7825fa9d6d
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
