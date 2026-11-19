-- Threat: !InfrastructureShared
-- Name: d6781c9170f9
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
