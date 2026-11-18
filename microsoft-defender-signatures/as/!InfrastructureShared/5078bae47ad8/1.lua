-- Threat: !InfrastructureShared
-- Name: 5078bae47ad8
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() > 2000000 and mp.getfilesize() < 2500000 then
  return mp.INFECTED
end
return mp.CLEAN
