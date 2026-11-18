-- Threat: !InfrastructureShared
-- Name: 2d78f2b688aa
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
