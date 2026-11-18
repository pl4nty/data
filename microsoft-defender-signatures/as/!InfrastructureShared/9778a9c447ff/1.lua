-- Threat: !InfrastructureShared
-- Name: 9778a9c447ff
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
