-- Threat: !InfrastructureShared
-- Name: b878b91960fc
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
