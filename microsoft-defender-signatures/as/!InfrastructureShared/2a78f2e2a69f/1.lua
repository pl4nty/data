-- Threat: !InfrastructureShared
-- Name: 2a78f2e2a69f
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 45058 then
  return mp.INFECTED
end
return mp.CLEAN
