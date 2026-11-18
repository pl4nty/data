-- Threat: !InfrastructureShared
-- Name: 297867c22b18
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
