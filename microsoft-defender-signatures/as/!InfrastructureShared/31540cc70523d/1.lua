-- Threat: !InfrastructureShared
-- Name: 31540cc70523d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
