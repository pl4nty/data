-- Threat: !InfrastructureShared
-- Name: 2b78288cd6e8
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
