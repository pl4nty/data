-- Threat: !InfrastructureShared
-- Name: 8b78b788a95e
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
