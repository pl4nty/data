-- Threat: !InfrastructureShared
-- Name: e078c2075071
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
