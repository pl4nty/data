-- Threat: !InfrastructureShared
-- Name: 12878627104ac
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
