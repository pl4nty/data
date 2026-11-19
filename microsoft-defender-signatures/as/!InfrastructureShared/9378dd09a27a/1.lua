-- Threat: !InfrastructureShared
-- Name: 9378dd09a27a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
