-- Threat: !InfrastructureShared
-- Name: 4f78f961f2a8
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") == true then
  return mp.INFECTED
end
return mp.CLEAN
