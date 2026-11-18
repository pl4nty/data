-- Threat: !InfrastructureShared
-- Name: 7d78c7dc02c4
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
