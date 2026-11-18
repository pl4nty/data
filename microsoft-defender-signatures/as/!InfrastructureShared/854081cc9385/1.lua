-- Threat: !InfrastructureShared
-- Name: 854081cc9385
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
