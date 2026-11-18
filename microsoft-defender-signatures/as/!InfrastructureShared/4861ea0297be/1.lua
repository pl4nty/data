-- Threat: !InfrastructureShared
-- Name: 4861ea0297be
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
