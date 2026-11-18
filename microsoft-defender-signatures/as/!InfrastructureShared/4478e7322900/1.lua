-- Threat: !InfrastructureShared
-- Name: 4478e7322900
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
