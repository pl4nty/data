-- Threat: !InfrastructureShared
-- Name: d978f831db08
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
