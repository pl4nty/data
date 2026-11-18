-- Threat: !InfrastructureShared
-- Name: 3540e53eac2d
-- Type: 21

if mp.get_mpattribute("NID:Win32/Xworm") then
  return mp.INFECTED
end
return mp.CLEAN
