-- Threat: !InfrastructureShared
-- Name: 75786f607f52
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.get_mpattribute("pea_no_security") and mp.getfilesize() == 3584 then
  return mp.INFECTED
end
return mp.CLEAN
