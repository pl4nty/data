-- Threat: !InfrastructureShared
-- Name: 3778ea6e0ae9
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
