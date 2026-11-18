-- Threat: !InfrastructureShared
-- Name: 8478db1ae9cb
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
