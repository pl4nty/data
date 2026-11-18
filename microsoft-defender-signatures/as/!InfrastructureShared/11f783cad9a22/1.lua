-- Threat: !InfrastructureShared
-- Name: 11f783cad9a22
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
