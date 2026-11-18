-- Threat: !InfrastructureShared
-- Name: e5785f2dcf95
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
