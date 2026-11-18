-- Threat: !InfrastructureShared
-- Name: 1127863d6c008
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 54000 then
  return mp.INFECTED
end
return mp.CLEAN
