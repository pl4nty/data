-- Threat: !InfrastructureShared
-- Name: c4b337127d6d
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  l_0_1 = string.lower(this_sigattrlog[3].utf8p2)
end
if string.find(l_0_1, "foreach", 1, true) and string.find(l_0_1, "split", 1, true) and string.find(l_0_1, "length -ge", 1, true) then
  local l_0_2, l_0_3 = pcall(mp.GetInlineScriptsFromCommandLine, l_0_0:lower())
  if l_0_2 and l_0_3 then
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      local l_0_6, l_0_7 = pcall(mp.ContextualExpandEnvironmentVariables, l_0_5)
      if l_0_6 and l_0_7 then
        bm.add_related_file(l_0_7)
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
