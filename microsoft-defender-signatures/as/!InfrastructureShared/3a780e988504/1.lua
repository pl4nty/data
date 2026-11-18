-- Threat: !InfrastructureShared
-- Name: 3a780e988504
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
