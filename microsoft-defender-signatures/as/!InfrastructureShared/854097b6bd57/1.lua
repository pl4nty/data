-- Threat: !InfrastructureShared
-- Name: 854097b6bd57
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
