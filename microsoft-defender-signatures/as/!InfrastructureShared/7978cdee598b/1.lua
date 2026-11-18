-- Threat: !InfrastructureShared
-- Name: 7978cdee598b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
