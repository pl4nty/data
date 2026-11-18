-- Threat: !InfrastructureShared
-- Name: 3b78ae6155c3
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
