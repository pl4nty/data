-- Threat: !InfrastructureShared
-- Name: 3078f16c87a1
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
