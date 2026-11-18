-- Threat: !InfrastructureShared
-- Name: 74780e9eab41
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
