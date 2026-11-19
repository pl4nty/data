-- Threat: !InfrastructureShared
-- Name: 48782e920868
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
