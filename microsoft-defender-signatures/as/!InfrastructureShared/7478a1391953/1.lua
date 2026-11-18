-- Threat: !InfrastructureShared
-- Name: 7478a1391953
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
