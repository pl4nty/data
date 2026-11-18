-- Threat: !InfrastructureShared
-- Name: 13a7805824f82
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
