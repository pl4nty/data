-- Threat: !InfrastructureShared
-- Name: 6e784f5485a2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
