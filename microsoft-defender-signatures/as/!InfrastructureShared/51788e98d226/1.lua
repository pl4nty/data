-- Threat: !InfrastructureShared
-- Name: 51788e98d226
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
