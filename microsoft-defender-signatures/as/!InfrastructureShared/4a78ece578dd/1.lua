-- Threat: !InfrastructureShared
-- Name: 4a78ece578dd
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
