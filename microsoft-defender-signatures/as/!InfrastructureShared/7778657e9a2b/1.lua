-- Threat: !InfrastructureShared
-- Name: 7778657e9a2b
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() > 2000000 and mp.getfilesize() < 2500000 then
  return mp.INFECTED
end
return mp.CLEAN
