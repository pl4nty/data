-- Threat: !InfrastructureShared
-- Name: c3786f4ae3be
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.get_mpattribute("pea_no_security") and mp.getfilesize() == 3072 then
  return mp.INFECTED
end
return mp.CLEAN
