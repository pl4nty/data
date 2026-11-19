-- Threat: !InfrastructureShared
-- Name: 5e78620e369f
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 450000 and mp.getfilesize() < 500000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
