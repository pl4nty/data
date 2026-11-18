-- Threat: !InfrastructureShared
-- Name: 159b3b30e8d88
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if contains(l_0_0, {
  "AlexaNSISPlugin",
  "Windows Photo Viewer\\PhotoViewer.dll",
  "cryptextopencer",
  "cryptextaddpfx",
  "cryptext.dll"
}) then
  return mp.CLEAN
end
local l_0_1 = extractDllForRegproc(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pcall(mp.ContextualExpandEnvironmentVariables, l_0_1)
if l_0_2 and l_0_3 then
  bm.add_related_file(l_0_3)
  triggerMemoryScanOnProcessTree(true, true, "SMS_M", 100, "Behavior:Win32/DllInject.SD")
end
return mp.INFECTED
