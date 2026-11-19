-- Threat: !InfrastructureShared
-- Name: 5978cccd4fcb
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
