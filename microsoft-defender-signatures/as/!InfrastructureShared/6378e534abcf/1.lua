-- Threat: !InfrastructureShared
-- Name: 6378e534abcf
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
