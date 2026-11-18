-- Threat: !InfrastructureShared
-- Name: 1561827ef40e
-- Type: 21

if mp.get_mpattribute("HSTR:SkypeSneak") and mp.get_mpattribute("HSTR:Win32/GenSpy") then
  return mp.INFECTED
end
return mp.CLEAN
