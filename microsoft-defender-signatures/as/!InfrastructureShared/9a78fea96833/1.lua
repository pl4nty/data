-- Threat: !InfrastructureShared
-- Name: 9a78fea96833
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
