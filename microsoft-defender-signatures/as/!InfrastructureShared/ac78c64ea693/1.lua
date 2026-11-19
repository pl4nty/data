-- Threat: !InfrastructureShared
-- Name: ac78c64ea693
-- Type: 21

if pehdr.NumberOfSections == 6 and mp.getfilesize() >= 210000 and mp.getfilesize() <= 213000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
