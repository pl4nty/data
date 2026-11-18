-- Threat: !InfrastructureShared
-- Name: b278db960bdc
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
