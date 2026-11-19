-- Threat: !InfrastructureShared
-- Name: 4540d610e3ee
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
