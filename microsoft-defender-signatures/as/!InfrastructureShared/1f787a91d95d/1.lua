-- Threat: !InfrastructureShared
-- Name: 1f787a91d95d
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
