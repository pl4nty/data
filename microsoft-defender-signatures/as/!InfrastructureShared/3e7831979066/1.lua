-- Threat: !InfrastructureShared
-- Name: 3e7831979066
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
