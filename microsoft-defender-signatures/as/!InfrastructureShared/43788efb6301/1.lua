-- Threat: !InfrastructureShared
-- Name: 43788efb6301
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
