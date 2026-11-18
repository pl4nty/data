-- Threat: !InfrastructureShared
-- Name: 2878d824d22c
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
