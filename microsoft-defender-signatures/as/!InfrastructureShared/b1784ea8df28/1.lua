-- Threat: !InfrastructureShared
-- Name: b1784ea8df28
-- Type: 21

if peattributes.x86_image == true and peattributes.hasexports == true and peattributes.epoutofimage == true and peattributes.no_security == true and peattributes.nx_bit_set == true and peattributes.no_ep == true then
  return mp.INFECTED
end
return mp.CLEAN
