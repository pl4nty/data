-- Threat: !InfrastructureShared
-- Name: 8861d5aeb3a7
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
