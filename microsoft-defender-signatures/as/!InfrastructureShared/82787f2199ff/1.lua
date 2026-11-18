-- Threat: !InfrastructureShared
-- Name: 82787f2199ff
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
