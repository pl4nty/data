-- Threat: !InfrastructureShared
-- Name: 53786a2244f1
-- Type: 21

if peattributes.isdll == true and peattributes.x86_image == true and peattributes.hasexports == true and peattributes.no_ep == true and peattributes.suspicious_dosheader == true and peattributes.no_security == true and peattributes.nx_bit_set == true and peattributes.headerchecksum0 == true and peattributes.no_comruntime == true and peattributes.epoutofimage == true then
  return mp.INFECTED
end
return mp.CLEAN
