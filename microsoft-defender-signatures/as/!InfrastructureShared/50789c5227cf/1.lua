-- Threat: !InfrastructureShared
-- Name: 50789c5227cf
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
