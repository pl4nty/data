-- Threat: !InfrastructureShared
-- Name: 207838f98e1e
-- Type: 21

if peattributes.amd64_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
