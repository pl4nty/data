-- Threat: !InfrastructureShared
-- Name: 101786771aea0
-- Type: 21

if peattributes.isdll == true and peattributes.x86_image == true and peattributes.hasexports == true and peattributes.no_ep == true and peattributes.no_security == true and peattributes.suspicious_falign == true and peattributes.epoutofimage == true and peattributes.hasappendeddata == true then
  return mp.INFECTED
end
return mp.CLEAN
