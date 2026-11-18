-- Threat: !InfrastructureShared
-- Name: 1167860148a61
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
