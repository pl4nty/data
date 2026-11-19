-- Threat: !InfrastructureShared
-- Name: 6c781a1d5c7b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
