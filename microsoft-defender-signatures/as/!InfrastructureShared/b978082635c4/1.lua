-- Threat: !InfrastructureShared
-- Name: b978082635c4
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
