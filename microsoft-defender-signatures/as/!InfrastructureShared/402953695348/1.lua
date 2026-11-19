-- Threat: !InfrastructureShared
-- Name: 402953695348
-- Type: 21

if mp.get_mpattribute("SCPT:Win32/WinLNK.HGI1") then
  return mp.INFECTED
end
return mp.CLEAN
