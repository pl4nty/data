-- Threat: !InfrastructureShared
-- Name: 3678ef4383cb
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
