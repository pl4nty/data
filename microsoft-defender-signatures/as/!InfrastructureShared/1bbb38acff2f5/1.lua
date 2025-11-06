-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1bbb38acff2f5\1.luac 

-- params : ...
-- function num : 0
if verify_memory_features_coverage_orgs() then
  local l_0_0, l_0_1 = nil, nil
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    l_0_0 = (mp.GetExecutablesFromCommandLine)((this_sigattrlog[3]).utf8p2)
  end
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
    l_0_1 = (mp.GetExecutablesFromCommandLine)((this_sigattrlog[4]).utf8p2)
  end
  if next(l_0_0) ~= nil and next(l_0_1) ~= nil then
    local l_0_2, l_0_3 = nil, nil
    l_0_2 = l_0_0[#l_0_0]
    l_0_3 = l_0_1[#l_0_1]
    if l_0_2 ~= nil and l_0_2 == l_0_3 then
      local l_0_4 = (bm.get_imagepath)()
      if l_0_4 ~= nil and ((string.match)(l_0_4, "/bin/%a*sh") or (string.find)(l_0_4, "perl", 1, true) or (string.find)(l_0_4, "python", 1, true)) then
        local l_0_5, l_0_6 = (bm.get_process_relationships)()
        for l_0_10,l_0_11 in ipairs(l_0_6) do
          (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", l_0_11.ppid)
        end
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

