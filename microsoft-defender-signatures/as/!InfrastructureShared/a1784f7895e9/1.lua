-- Threat: !InfrastructureShared
-- Name: a1784f7895e9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
