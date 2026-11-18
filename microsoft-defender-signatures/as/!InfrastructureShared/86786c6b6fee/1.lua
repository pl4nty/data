-- Threat: !InfrastructureShared
-- Name: 86786c6b6fee
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
