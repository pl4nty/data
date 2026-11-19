-- Threat: !InfrastructureShared
-- Name: 5478190d410f
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
