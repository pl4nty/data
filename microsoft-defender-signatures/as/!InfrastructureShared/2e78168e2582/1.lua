-- Threat: !InfrastructureShared
-- Name: 2e78168e2582
-- Type: 21
-- Flags: 1

if epcode[1] == 232 and epcode[6] == 233 and mp.get_mpattribute("Necurs_ObfuscatorADs") then
  return mp.SUSPICIOUS
end
return mp.CLEAN
