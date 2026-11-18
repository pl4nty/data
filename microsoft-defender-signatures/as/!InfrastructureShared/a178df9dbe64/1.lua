-- Threat: !InfrastructureShared
-- Name: a178df9dbe64
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.isdll and peattributes.ismsil and mp.get_mpattribute("SIGATTR:Trojan:MSIL/WMITask.HA!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
