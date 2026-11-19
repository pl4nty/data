-- Threat: !InfrastructureShared
-- Name: c2616e9f9a19
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
