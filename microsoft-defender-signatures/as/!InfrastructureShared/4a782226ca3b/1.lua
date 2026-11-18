-- Threat: !InfrastructureShared
-- Name: 4a782226ca3b
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 1500000 and mp.getfilesize() < 2000000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
