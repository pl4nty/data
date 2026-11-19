-- Threat: !InfrastructureShared
-- Name: 8b78205a4055
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
