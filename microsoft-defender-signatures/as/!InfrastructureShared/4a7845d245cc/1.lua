-- Threat: !InfrastructureShared
-- Name: 4a7845d245cc
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
