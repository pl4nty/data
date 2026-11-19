-- Threat: !InfrastructureShared
-- Name: 1178746d3b98
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.get_mpattribute("NID:Win32/Qbot.ZXX!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
