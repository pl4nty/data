-- Threat: !InfrastructureShared
-- Name: 52780e4da8ec
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
