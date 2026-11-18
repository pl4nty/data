-- Threat: !InfrastructureShared
-- Name: 3c785e7cdeeb
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
