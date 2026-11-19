-- Threat: !InfrastructureShared
-- Name: 81788f2bf9ef
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
