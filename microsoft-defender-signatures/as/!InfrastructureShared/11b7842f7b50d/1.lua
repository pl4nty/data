-- Threat: !InfrastructureShared
-- Name: 11b7842f7b50d
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
