-- Threat: !InfrastructureShared
-- Name: 636140e73a80
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
