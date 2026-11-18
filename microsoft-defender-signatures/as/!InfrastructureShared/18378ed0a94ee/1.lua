-- Threat: !InfrastructureShared
-- Name: 18378ed0a94ee
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
