-- Threat: !InfrastructureShared
-- Name: 2578898ce814
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
