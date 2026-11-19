-- Threat: !InfrastructureShared
-- Name: 25783759967b
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
