-- Threat: !InfrastructureShared
-- Name: 2b783870786e
-- Type: 21

if mp.get_mpattribute("HSTR:Exception:Mimikatz.A") then
  return mp.CLEAN
end
return mp.INFECTED
