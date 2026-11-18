-- Threat: !InfrastructureShared
-- Name: 7878db8a02c0
-- Type: 21

if mp.get_mpattribute("HSTR:Exception:Mimikatz.A") then
  return mp.CLEAN
end
return mp.INFECTED
