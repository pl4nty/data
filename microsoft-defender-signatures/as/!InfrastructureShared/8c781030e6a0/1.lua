-- Threat: !InfrastructureShared
-- Name: 8c781030e6a0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
