-- Threat: !InfrastructureShared
-- Name: 4c78eba85f4e
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
