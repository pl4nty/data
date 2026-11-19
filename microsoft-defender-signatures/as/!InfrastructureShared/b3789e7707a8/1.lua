-- Threat: !InfrastructureShared
-- Name: b3789e7707a8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
