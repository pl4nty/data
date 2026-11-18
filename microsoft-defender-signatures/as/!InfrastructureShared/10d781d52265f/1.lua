-- Threat: !InfrastructureShared
-- Name: 10d781d52265f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
