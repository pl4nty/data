-- Threat: !InfrastructureShared
-- Name: 4f7879f85b1d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
