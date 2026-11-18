-- Threat: !InfrastructureShared
-- Name: 6a787a7d3c41
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
