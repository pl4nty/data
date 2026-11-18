-- Threat: !InfrastructureShared
-- Name: 96780e92dca3
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
