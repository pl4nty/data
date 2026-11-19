-- Threat: !InfrastructureShared
-- Name: 17078131a1e36
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
