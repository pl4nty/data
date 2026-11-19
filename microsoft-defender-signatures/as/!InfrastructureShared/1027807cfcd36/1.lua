-- Threat: !InfrastructureShared
-- Name: 1027807cfcd36
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
