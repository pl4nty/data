-- Threat: !InfrastructureShared
-- Name: 1b786019ea74
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
