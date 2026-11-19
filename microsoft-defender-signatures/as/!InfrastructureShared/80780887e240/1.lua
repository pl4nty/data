-- Threat: !InfrastructureShared
-- Name: 80780887e240
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
