-- Threat: !InfrastructureShared
-- Name: ea78b3cd1652
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
