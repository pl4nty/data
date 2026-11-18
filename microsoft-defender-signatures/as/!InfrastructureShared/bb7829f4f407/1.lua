-- Threat: !InfrastructureShared
-- Name: bb7829f4f407
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
