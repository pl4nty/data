-- Threat: !InfrastructureShared
-- Name: 1b7863d788b8
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
