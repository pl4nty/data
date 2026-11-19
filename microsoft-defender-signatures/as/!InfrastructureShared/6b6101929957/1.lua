-- Threat: !InfrastructureShared
-- Name: 6b6101929957
-- Type: 21

if peattributes.no_security == false then
  return mp.INFECTED
end
return mp.CLEAN
