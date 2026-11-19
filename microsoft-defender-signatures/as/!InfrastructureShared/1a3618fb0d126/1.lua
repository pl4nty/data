-- Threat: !InfrastructureShared
-- Name: 1a3618fb0d126
-- Type: 21

if mp.get_mpattribute("HSTR:WinNT/Bancos.K") then
  return mp.INFECTED
end
return mp.SUSPICIOUS
