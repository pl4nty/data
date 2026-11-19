-- Threat: !InfrastructureShared
-- Name: 21788b251f0a
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
