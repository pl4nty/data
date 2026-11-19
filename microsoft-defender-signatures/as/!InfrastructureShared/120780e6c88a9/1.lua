-- Threat: !InfrastructureShared
-- Name: 120780e6c88a9
-- Type: 21

if mp.get_mpattribute("pea_headerchecksum0") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
