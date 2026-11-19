-- Threat: !InfrastructureShared
-- Name: 2d782a3d3676
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
