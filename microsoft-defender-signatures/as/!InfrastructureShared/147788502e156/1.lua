-- Threat: !InfrastructureShared
-- Name: 147788502e156
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 410000 and mp.getfilesize() < 920000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
