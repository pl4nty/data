-- Threat: !InfrastructureShared
-- Name: 954002400a9a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
