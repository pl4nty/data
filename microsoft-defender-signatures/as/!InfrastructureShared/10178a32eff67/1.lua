-- Threat: !InfrastructureShared
-- Name: 10178a32eff67
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
