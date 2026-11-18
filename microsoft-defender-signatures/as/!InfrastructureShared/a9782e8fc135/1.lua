-- Threat: !InfrastructureShared
-- Name: a9782e8fc135
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
