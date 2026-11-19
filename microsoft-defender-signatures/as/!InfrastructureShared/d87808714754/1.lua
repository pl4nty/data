-- Threat: !InfrastructureShared
-- Name: d87808714754
-- Type: 21

if mp.get_mpattribute("HSTR:Exception:Mimikatz.A") then
  return mp.CLEAN
end
return mp.INFECTED
