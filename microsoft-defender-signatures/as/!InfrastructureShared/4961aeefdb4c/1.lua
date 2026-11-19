-- Threat: !InfrastructureShared
-- Name: 4961aeefdb4c
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
