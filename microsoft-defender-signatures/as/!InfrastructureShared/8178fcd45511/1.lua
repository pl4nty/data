-- Threat: !InfrastructureShared
-- Name: 8178fcd45511
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
