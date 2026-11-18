-- Threat: !InfrastructureShared
-- Name: 6b7885ccedf3
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
