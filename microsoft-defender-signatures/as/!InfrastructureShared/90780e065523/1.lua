-- Threat: !InfrastructureShared
-- Name: 90780e065523
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
