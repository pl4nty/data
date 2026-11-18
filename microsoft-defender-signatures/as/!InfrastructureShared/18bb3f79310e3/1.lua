-- Threat: !InfrastructureShared
-- Name: 18bb3f79310e3
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[3].utf8p2)
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_1 = mp.GetExecutablesFromCommandLine(this_sigattrlog[4].utf8p2)
end
if next(l_0_0) ~= nil and next(l_0_1) ~= nil then
  local l_0_2, l_0_3
  l_0_2 = l_0_0[#l_0_0]
  l_0_3 = l_0_1[#l_0_1]
  if l_0_2 ~= nil and l_0_2 == l_0_3 then
    local l_0_4 = bm.get_imagepath()
    if l_0_4 ~= nil and (string.match(l_0_4, "/bin/%a*sh") or string.find(l_0_4, "perl", 1, true) or string.find(l_0_4, "python", 1, true)) then
      local l_0_5, l_0_6 = bm.get_process_relationships()
      for l_0_7, l_0_8 in ipairs(l_0_6) do
        bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_8.ppid)
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
