-- Threat: !InfrastructureShared
-- Name: 6d78cbd41551
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
