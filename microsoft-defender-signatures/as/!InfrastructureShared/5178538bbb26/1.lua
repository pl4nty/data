-- Threat: !InfrastructureShared
-- Name: 5178538bbb26
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
