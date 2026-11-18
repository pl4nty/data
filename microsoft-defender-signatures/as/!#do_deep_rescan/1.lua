-- Threat: !#do_deep_rescan
-- Type: 10

if mp.get_mpattribute("LOWFI:VirTool:Win32/Obfuscator.QG") then
  return mp.INFECTED
end
return mp.CLEAN
