-- Threat: !InfrastructureShared
-- Name: b378783b1ca6
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
