-- Threat: !InfrastructureShared
-- Name: 854063f3a4d0
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_exports == true then
  return mp.INFECTED
end
return mp.CLEAN
