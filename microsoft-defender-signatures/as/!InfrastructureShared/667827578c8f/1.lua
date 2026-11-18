-- Threat: !InfrastructureShared
-- Name: 667827578c8f
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.get_mpattribute("pea_no_security") and mp.getfilesize() == 4608 then
  return mp.INFECTED
end
return mp.CLEAN
