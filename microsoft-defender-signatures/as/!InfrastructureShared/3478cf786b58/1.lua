-- Threat: !InfrastructureShared
-- Name: 3478cf786b58
-- Type: 21

if mp.get_mpattribute("HSTR:Exception:Mimikatz.A") then
  return mp.CLEAN
end
return mp.INFECTED
