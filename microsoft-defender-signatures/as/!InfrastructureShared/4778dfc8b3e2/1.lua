-- Threat: !InfrastructureShared
-- Name: 4778dfc8b3e2
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 2097152 and mp.getfilesize() < 4194304 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
