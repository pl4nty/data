-- Threat: !InfrastructureShared
-- Name: 8b789361b2dd
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image and mp.getfilesize() < 409604 then
  return mp.INFECTED
end
return mp.CLEAN
