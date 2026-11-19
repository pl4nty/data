-- Threat: !InfrastructureShared
-- Name: 11540c6191caf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
