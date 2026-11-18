-- Threat: !InfrastructureShared
-- Name: 6478ccf5f348
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
