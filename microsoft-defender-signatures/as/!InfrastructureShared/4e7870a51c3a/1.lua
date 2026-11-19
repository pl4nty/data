-- Threat: !InfrastructureShared
-- Name: 4e7870a51c3a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
