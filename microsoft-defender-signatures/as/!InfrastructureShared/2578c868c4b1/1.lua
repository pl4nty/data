-- Threat: !InfrastructureShared
-- Name: 2578c868c4b1
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
