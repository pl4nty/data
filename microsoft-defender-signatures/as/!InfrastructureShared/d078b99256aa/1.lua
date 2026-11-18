-- Threat: !InfrastructureShared
-- Name: d078b99256aa
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
