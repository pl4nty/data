-- Threat: !InfrastructureShared
-- Name: d278b863d1b8
-- Type: 21

if mp.getfilesize() < 9000000 and mp.getfilesize() > 8000000 then
  return mp.INFECTED
end
return mp.CLEAN
