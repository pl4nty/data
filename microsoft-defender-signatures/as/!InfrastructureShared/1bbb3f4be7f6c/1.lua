-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1bbb3f4be7f6c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 ~= nil and l_0_0 ~= "" and l_0_0:lower() == "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" then
  local l_0_1, l_0_2, l_0_3 = nil, nil, nil
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    l_0_1 = (mp.GetExecutablesFromCommandLine)((this_sigattrlog[3]).utf8p2)
  end
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
    l_0_2 = (mp.GetExecutablesFromCommandLine)((this_sigattrlog[4]).utf8p2)
  end
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
    l_0_3 = (mp.GetExecutablesFromCommandLine)((this_sigattrlog[5]).utf8p2)
  end
  if next(l_0_1) ~= nil and next(l_0_2) ~= nil and next(l_0_3) ~= nil then
    local l_0_4, l_0_5, l_0_6 = nil, nil, nil
    l_0_4 = l_0_1[#l_0_1]
    l_0_5 = l_0_2[#l_0_2]
    l_0_6 = l_0_3[#l_0_3]
    if l_0_4 ~= nil and l_0_4 == l_0_5 and l_0_5 == l_0_6 then
      local l_0_7 = (bm.get_imagepath)()
      if l_0_7 ~= nil and ((string.match)(l_0_7, "/bin/%a*sh") or (string.find)(l_0_7, "perl", 1, true) or (string.find)(l_0_7, "python", 1, true)) then
        local l_0_8, l_0_9 = (bm.get_process_relationships)()
        for l_0_13,l_0_14 in ipairs(l_0_9) do
          (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", l_0_14.ppid)
        end
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

