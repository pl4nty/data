-- Threat: !InfrastructureShared
-- Name: 4d782870b9bb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
