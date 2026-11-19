-- Threat: !InfrastructureShared
-- Name: 2978d0d4c0af
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
