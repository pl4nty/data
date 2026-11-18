-- Threat: !InfrastructureShared
-- Name: 5a78842ae278
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
