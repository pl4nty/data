-- Threat: !InfrastructureShared
-- Name: 7b780c114eae
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
