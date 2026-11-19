-- Threat: !InfrastructureShared
-- Name: de7850d3990d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
