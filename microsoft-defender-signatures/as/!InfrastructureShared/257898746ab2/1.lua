-- Threat: !InfrastructureShared
-- Name: 257898746ab2
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
