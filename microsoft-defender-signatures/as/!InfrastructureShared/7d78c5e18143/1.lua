-- Threat: !InfrastructureShared
-- Name: 7d78c5e18143
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
