-- Threat: !InfrastructureShared
-- Name: 3761572af884
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
