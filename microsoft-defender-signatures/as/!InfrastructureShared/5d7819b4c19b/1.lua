-- Threat: !InfrastructureShared
-- Name: 5d7819b4c19b
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
