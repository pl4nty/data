-- Threat: !InfrastructureShared
-- Name: 15d7844cbb0d7
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
