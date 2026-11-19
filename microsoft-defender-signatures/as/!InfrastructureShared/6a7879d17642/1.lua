-- Threat: !InfrastructureShared
-- Name: 6a7879d17642
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 159834 then
  return mp.INFECTED
end
return mp.CLEAN
