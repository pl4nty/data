-- Threat: !InfrastructureShared
-- Name: 3e780e33da15
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
