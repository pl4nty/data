-- Threat: !InfrastructureShared
-- Name: 2778e8f2373b
-- Type: 21

if peattributes.isdll == true and mp.get_mpattribute("NID:Win32/Qakbot.PP!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
