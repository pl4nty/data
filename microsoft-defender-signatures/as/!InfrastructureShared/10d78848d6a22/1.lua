-- Threat: !InfrastructureShared
-- Name: 10d78848d6a22
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
