-- Threat: !InfrastructureShared
-- Name: 2b78d5376cb9
-- Type: 21

if mp.get_mpattribute("HSTR:Exception:Mimikatz.A") then
  return mp.CLEAN
end
return mp.INFECTED
