-- Threat: !InfrastructureShared
-- Name: 407893e3cbbd
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
