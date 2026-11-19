-- Threat: !InfrastructureShared
-- Name: b540afb01d8b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
