-- Threat: !InfrastructureShared
-- Name: 3540d2ae2c2b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
