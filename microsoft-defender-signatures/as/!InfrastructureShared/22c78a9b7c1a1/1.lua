-- Threat: !InfrastructureShared
-- Name: 22c78a9b7c1a1
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image and mp.getfilesize() < 20994 then
  return mp.INFECTED
end
return mp.CLEAN
