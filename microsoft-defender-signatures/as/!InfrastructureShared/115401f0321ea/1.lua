-- Threat: !InfrastructureShared
-- Name: 115401f0321ea
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 1300000 and mp.getfilesize() < 3200000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
