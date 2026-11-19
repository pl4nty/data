-- Threat: !InfrastructureShared
-- Name: 6a7890a45805
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
