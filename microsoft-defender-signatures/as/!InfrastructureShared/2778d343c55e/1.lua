-- Threat: !InfrastructureShared
-- Name: 2778d343c55e
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
