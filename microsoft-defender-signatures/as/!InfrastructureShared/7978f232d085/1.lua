-- Threat: !InfrastructureShared
-- Name: 7978f232d085
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
