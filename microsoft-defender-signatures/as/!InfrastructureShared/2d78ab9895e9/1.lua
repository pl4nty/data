-- Threat: !InfrastructureShared
-- Name: 2d78ab9895e9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
