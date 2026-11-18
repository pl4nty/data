-- Threat: !InfrastructureShared
-- Name: 4c7859c1ef50
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
