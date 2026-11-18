-- Threat: !InfrastructureShared
-- Name: 2a780fb7b6ae
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
