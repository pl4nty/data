-- Threat: !InfrastructureShared
-- Name: 2f781d5c887e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
