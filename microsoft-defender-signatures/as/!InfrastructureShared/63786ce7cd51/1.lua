-- Threat: !InfrastructureShared
-- Name: 63786ce7cd51
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") == true then
  return mp.INFECTED
end
return mp.CLEAN
