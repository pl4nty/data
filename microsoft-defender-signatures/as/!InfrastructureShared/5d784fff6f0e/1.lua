-- Threat: !InfrastructureShared
-- Name: 5d784fff6f0e
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  return mp.SUSPICIOUS
end
mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.AOV")
return mp.CLEAN
