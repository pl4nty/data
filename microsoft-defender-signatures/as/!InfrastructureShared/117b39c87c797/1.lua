-- Threat: !InfrastructureShared
-- Name: 117b39c87c797
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
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
local l_0_8, l_0_9 = pcall(mp.GetInlineScriptsFromCommandLine, l_0_1:lower())
if l_0_8 and l_0_9 then
  for l_0_10, l_0_11 in ipairs(l_0_9) do
    local l_0_12, l_0_13 = pcall(mp.ContextualExpandEnvironmentVariables, l_0_11)
    if l_0_12 and l_0_13 then
      bm.add_related_file(l_0_13)
    end
  end
end
return mp.INFECTED
