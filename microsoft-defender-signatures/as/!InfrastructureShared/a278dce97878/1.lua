-- Threat: !InfrastructureShared
-- Name: a278dce97878
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
