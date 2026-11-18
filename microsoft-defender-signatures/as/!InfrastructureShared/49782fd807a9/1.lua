-- Threat: !InfrastructureShared
-- Name: 49782fd807a9
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
