-- Threat: !InfrastructureShared
-- Name: bd7861abb93b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
