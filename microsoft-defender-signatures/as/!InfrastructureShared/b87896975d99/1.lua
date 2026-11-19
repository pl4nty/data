-- Threat: !InfrastructureShared
-- Name: b87896975d99
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 184322 then
  return mp.INFECTED
end
return mp.CLEAN
