-- Threat: !InfrastructureShared
-- Name: 60785578055d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
