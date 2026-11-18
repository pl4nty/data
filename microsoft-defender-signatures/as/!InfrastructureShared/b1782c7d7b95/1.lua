-- Threat: !InfrastructureShared
-- Name: b1782c7d7b95
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() > 90000 and mp.getfilesize() < 150000 then
  return mp.INFECTED
end
return mp.CLEAN
