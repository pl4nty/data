-- Threat: !InfrastructureShared
-- Name: 307874f744d7
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
