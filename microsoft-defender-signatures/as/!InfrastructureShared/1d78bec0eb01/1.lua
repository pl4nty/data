-- Threat: !InfrastructureShared
-- Name: 1d78bec0eb01
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
