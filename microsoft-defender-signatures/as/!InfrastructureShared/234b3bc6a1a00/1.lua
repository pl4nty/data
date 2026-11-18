-- Threat: !InfrastructureShared
-- Name: 234b3bc6a1a00
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p2
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_1 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_1 = this_sigattrlog[2].utf8p2
end
local l_0_2, l_0_3 = pcall(mp.GetInlineScriptsFromCommandLine, l_0_0:lower())
if l_0_2 and l_0_3 then
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    local l_0_6, l_0_7 = pcall(mp.ContextualExpandEnvironmentVariables, l_0_5)
    if l_0_6 and l_0_7 then
      bm.add_related_file(l_0_7)
    end
  end
end
local l_0_8 = extractDllForRegproc(l_0_1)
if l_0_8 and mp.IsKnownFriendlyFile(l_0_8, true, false) == false then
  bm.add_related_file(l_0_8)
end
triggerMemoryScanOnProcessTree(true, true, "SMS_M", 1000, "Behavior:Win32/Qakbot.SD")
return mp.INFECTED
