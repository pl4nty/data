-- Threat: !InfrastructureShared
-- Name: 6d78543bb95a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
