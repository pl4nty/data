-- Threat: !InfrastructureShared
-- Name: 5978d29b9ef0
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
