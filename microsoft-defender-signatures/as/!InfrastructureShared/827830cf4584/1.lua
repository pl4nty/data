-- Threat: !InfrastructureShared
-- Name: 827830cf4584
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
