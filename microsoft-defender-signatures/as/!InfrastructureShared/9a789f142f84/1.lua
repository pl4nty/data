-- Threat: !InfrastructureShared
-- Name: 9a789f142f84
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
