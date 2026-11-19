-- Threat: !InfrastructureShared
-- Name: 387847a0845e
-- Type: 21

if peattributes.amd64_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
