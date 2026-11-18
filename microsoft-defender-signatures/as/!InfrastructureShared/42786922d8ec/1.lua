-- Threat: !InfrastructureShared
-- Name: 42786922d8ec
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
