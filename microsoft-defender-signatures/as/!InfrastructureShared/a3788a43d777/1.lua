-- Threat: !InfrastructureShared
-- Name: a3788a43d777
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
