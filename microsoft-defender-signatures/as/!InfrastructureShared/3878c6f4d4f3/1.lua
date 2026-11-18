-- Threat: !InfrastructureShared
-- Name: 3878c6f4d4f3
-- Type: 21

if peattributes.x86_image == true and peattributes.epoutofimage == true and peattributes.hasexports == true and peattributes.no_security == true and peattributes.no_uidata == true and peattributes.no_exception == true and peattributes.no_mipsgp == true and peattributes.no_boundimport == true and peattributes.no_ep == true then
  return mp.INFECTED
end
return mp.CLEAN
