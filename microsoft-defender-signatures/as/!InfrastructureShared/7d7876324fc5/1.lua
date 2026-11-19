-- Threat: !InfrastructureShared
-- Name: 7d7876324fc5
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
