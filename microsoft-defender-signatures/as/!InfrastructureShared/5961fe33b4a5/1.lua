-- Threat: !InfrastructureShared
-- Name: 5961fe33b4a5
-- Type: 21

if peattributes.epoutofimage == true and peattributes.x86_image == true and peattributes.hasexports == true and peattributes.no_ep == true and peattributes.no_security == true and peattributes.suspicious_falign == true and peattributes.no_comruntime == true and peattributes.no_delayimport == true and peattributes.no_uidata == true then
  return mp.INFECTED
end
return mp.CLEAN
