-- Threat: !InfrastructureShared
-- Name: 65788185801e
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
