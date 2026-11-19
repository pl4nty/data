-- Threat: !InfrastructureShared
-- Name: 81787e16ba75
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
