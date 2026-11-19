-- Threat: !InfrastructureShared
-- Name: 6d78669dba2d
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
