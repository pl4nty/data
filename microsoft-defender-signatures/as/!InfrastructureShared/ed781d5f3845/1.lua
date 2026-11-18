-- Threat: !InfrastructureShared
-- Name: ed781d5f3845
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
