-- Threat: !InfrastructureShared
-- Name: 3778f844d57f
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
