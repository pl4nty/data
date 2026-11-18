-- Threat: !InfrastructureShared
-- Name: 4578f6dcf88e
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
