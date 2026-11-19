-- Threat: !InfrastructureShared
-- Name: 487803930a6a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
