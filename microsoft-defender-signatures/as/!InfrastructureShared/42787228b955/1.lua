-- Threat: !InfrastructureShared
-- Name: 42787228b955
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
