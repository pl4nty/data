-- Threat: !InfrastructureShared
-- Name: 20783b53663a
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
