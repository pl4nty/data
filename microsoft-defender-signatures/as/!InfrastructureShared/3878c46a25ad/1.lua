-- Threat: !InfrastructureShared
-- Name: 3878c46a25ad
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
