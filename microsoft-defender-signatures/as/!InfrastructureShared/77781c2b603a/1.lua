-- Threat: !InfrastructureShared
-- Name: 77781c2b603a
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
