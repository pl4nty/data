-- Threat: !InfrastructureShared
-- Name: 3a787e58ef51
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
