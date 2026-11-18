-- Threat: !InfrastructureShared
-- Name: b678113aba8d
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
