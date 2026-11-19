-- Threat: !InfrastructureShared
-- Name: 4c7873924cd7
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
