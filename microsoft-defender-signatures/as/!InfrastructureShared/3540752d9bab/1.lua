-- Threat: !InfrastructureShared
-- Name: 3540752d9bab
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
