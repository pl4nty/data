-- Threat: !InfrastructureShared
-- Name: c2781d8e5db2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
