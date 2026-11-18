-- Threat: !InfrastructureShared
-- Name: 5678b2b5247c
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
