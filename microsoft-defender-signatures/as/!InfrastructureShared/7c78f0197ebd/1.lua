-- Threat: !InfrastructureShared
-- Name: 7c78f0197ebd
-- Type: 21

if mp.getfilesize() > 293417 then
  return mp.CLEAN
end
mp.set_mpattribute("LoD:VirTool:Win32/Obfuscator.ACV.2")
pe.set_peattribute("deep_analysis", true)
pe.reemulate()
return mp.INFECTED
