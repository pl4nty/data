-- Threat: !InfrastructureShared
-- Name: 77785155b4ec
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
