-- Threat: !InfrastructureShared
-- Name: 8878ac317302
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
