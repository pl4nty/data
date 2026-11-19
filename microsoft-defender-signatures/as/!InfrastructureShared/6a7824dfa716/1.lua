-- Threat: !InfrastructureShared
-- Name: 6a7824dfa716
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() > 560000 and mp.getfilesize() < 760000 then
  return mp.INFECTED
end
return mp.CLEAN
