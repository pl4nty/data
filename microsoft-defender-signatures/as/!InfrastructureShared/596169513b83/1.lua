-- Threat: !InfrastructureShared
-- Name: 596169513b83
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
