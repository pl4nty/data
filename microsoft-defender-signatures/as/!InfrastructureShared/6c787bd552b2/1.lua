-- Threat: !InfrastructureShared
-- Name: 6c787bd552b2
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
