-- Threat: !InfrastructureShared
-- Name: 6c7887c22c6f
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.get_mpattribute("pea_no_security") and mp.getfilesize() == 3584 then
  return mp.INFECTED
end
return mp.CLEAN
