-- Threat: !InfrastructureShared
-- Name: 2a78cacb9bb9
-- Type: 21

if mp.getfilesize() < 1600000 and mp.getfilesize() > 1300000 and peattributes.no_security and pehdr.NumberOfSections == 1 and peattributes.isexe == true and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
