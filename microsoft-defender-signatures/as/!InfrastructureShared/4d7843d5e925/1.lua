-- Threat: !InfrastructureShared
-- Name: 4d7843d5e925
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
