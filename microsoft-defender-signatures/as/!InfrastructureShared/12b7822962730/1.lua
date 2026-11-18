-- Threat: !InfrastructureShared
-- Name: 12b7822962730
-- Type: 21

if mp.getfilesize() < 1024000 and pehdr.NumberOfSections == 3 and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
