-- Threat: !InfrastructureShared
-- Name: a540f3e286e6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
