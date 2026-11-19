-- Threat: !InfrastructureShared
-- Name: a078933f1d1e
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
