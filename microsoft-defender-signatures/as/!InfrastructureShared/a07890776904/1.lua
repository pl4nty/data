-- Threat: !InfrastructureShared
-- Name: a07890776904
-- Type: 21

if mp.get_mpattribute("pea_headerchecksum0") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
