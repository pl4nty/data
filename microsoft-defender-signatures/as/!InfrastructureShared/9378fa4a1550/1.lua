-- Threat: !InfrastructureShared
-- Name: 9378fa4a1550
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
