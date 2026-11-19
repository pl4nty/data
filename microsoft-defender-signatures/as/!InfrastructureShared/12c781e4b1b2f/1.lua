-- Threat: !InfrastructureShared
-- Name: 12c781e4b1b2f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
