-- Threat: !InfrastructureShared
-- Name: 3ac78f2de668a
-- Type: 21

if mp.get_mpattribute("HSTR:Exception:Mimikatz.A") then
  return mp.CLEAN
end
return mp.INFECTED
