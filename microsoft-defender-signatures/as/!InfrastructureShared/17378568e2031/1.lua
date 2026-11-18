-- Threat: !InfrastructureShared
-- Name: 17378568e2031
-- Type: 21

if peattributes.amd64_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
