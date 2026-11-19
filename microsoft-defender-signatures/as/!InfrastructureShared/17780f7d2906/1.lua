-- Threat: !InfrastructureShared
-- Name: 17780f7d2906
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
