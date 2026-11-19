-- Threat: !InfrastructureShared
-- Name: a378e607c15f
-- Type: 21

if peattributes.amd64_image and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
