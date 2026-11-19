-- Threat: !InfrastructureShared
-- Name: 39955299f7dd
-- Type: 21

if mp.get_mpattribute("FOPEX:VirTool:Win32/Obfuscator.AKN") then
  pe.mmap_patch_va(pevars.sigaddr + 6, "\131\192\t")
end
return mp.INFECTED
