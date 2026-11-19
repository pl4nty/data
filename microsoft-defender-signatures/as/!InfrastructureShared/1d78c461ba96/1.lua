-- Threat: !InfrastructureShared
-- Name: 1d78c461ba96
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
