-- Threat: !InfrastructureShared
-- Name: 3378f3a6f91f
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
