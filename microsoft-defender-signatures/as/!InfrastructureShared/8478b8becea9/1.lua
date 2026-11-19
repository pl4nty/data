-- Threat: !InfrastructureShared
-- Name: 8478b8becea9
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image and mp.getfilesize() < 20000 then
  return mp.INFECTED
end
return mp.CLEAN
