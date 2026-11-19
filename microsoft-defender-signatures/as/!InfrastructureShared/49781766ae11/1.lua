-- Threat: !InfrastructureShared
-- Name: 49781766ae11
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
