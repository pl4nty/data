-- Threat: !InfrastructureShared
-- Name: a378e6fa3b7e
-- Type: 21

if peattributes.ismsil and mp.get_mpattribute("pea_has_msilresources") and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
