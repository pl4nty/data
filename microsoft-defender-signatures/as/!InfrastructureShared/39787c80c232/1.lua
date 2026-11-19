-- Threat: !InfrastructureShared
-- Name: 39787c80c232
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
