-- Threat: !InfrastructureShared
-- Name: 14078442c29d8
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
