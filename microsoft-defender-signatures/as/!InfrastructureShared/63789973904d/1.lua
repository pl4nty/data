-- Threat: !InfrastructureShared
-- Name: 63789973904d
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
