-- Threat: !InfrastructureShared
-- Name: 6d78e6da2649
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
