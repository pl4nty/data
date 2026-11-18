-- Threat: !InfrastructureShared
-- Name: 6678851135d8
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
