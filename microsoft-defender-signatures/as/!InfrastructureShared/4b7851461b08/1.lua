-- Threat: !InfrastructureShared
-- Name: 4b7851461b08
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
