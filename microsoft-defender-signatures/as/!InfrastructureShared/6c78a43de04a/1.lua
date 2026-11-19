-- Threat: !InfrastructureShared
-- Name: 6c78a43de04a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
