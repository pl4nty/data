-- Threat: !InfrastructureShared
-- Name: 9c78d6d882dc
-- Type: 21

if peattributes.x86_image == true and peattributes.hasexports == true and peattributes.epinfirstsect == true and peattributes.suspicious_linker_version == true and peattributes.no_security == true and peattributes.nx_bit_set == true and peattributes.headerchecksum0 == true then
  return mp.INFECTED
end
return mp.CLEAN
