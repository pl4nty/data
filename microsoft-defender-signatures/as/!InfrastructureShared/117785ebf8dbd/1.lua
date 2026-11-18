-- Threat: !InfrastructureShared
-- Name: 117785ebf8dbd
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() > 6000000 then
  return mp.INFECTED
end
return mp.CLEAN
