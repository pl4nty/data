-- Threat: !InfrastructureShared
-- Name: 4778489c53c6
-- Type: 21

if peattributes.isdll == true and mp.get_mpattribute("NID:Win32/Qakbot.MA!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
