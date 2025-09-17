-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\14bb3e1d3093f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 ~= nil and l_0_0 ~= "" and l_0_0:lower() == "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" then
  local l_0_1 = (bm.get_imagepath)()
  if l_0_1 ~= nil and ((string.match)(l_0_1, "/bin/%a*sh") or (string.find)(l_0_1, "perl", 1, true) or (string.find)(l_0_1, "python", 1, true)) then
    local l_0_2, l_0_3 = (bm.get_process_relationships)()
    for l_0_7,l_0_8 in ipairs(l_0_3) do
      (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", l_0_8.ppid)
    end
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

