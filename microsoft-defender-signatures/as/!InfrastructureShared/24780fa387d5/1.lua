-- Threat: !InfrastructureShared
-- Name: 24780fa387d5
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
