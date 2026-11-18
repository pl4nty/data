-- Threat: !InfrastructureShared
-- Name: 73780c09f1a4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
