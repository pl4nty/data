-- Threat: !InfrastructureShared
-- Name: 6f786e33cc72
-- Type: 21

if mp.get_mpattribute("NID:VirTool:Win32/Obfuscator.ANJ") then
  return mp.SUSPICIOUS
end
return mp.LOWFI
