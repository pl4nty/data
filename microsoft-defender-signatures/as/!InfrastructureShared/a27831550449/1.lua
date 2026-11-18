-- Threat: !InfrastructureShared
-- Name: a27831550449
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
