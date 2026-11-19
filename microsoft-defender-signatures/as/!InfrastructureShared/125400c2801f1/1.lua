-- Threat: !InfrastructureShared
-- Name: 125400c2801f1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
