-- Threat: !InfrastructureShared
-- Name: 26578727a4d44
-- Type: 21

if mp.get_mpattribute("HSTR:Exception:Mimikatz.A") then
  return mp.CLEAN
end
return mp.INFECTED
