-- Threat: !InfrastructureShared
-- Name: 4a78b0fac414
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
