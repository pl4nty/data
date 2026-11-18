-- Threat: !InfrastructureShared
-- Name: a9782a9ba751
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
