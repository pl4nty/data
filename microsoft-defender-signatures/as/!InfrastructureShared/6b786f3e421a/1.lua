-- Threat: !InfrastructureShared
-- Name: 6b786f3e421a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
