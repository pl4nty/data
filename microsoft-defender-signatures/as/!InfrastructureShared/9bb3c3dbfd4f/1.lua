-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9bb3c3dbfd4f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "767a35f6-ae33-4609-8630-c7d7a86ed134" then
  return mp.CLEAN
end
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = l_0_1.command_line
local l_0_3 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
  l_0_4 = (string.lower)((this_sigattrlog[2]).utf8p2)
end
if l_0_4 == "" or l_0_4 == nil or #l_0_4 > 150 or (string.find)(l_0_4, "github.com", 1, true) then
  return mp.CLEAN
end
for l_0_8,l_0_9,l_0_10 in l_0_4:gmatch("https?://[%w%.%-:]+/(%w+)/(%w+)()") do
  if #l_0_8 >= 4 and #l_0_8 <= 8 and l_0_8:match("^[%l%d]+$") and #l_0_9 >= 10 and #l_0_9 <= 16 and l_0_9:find("%d") and l_0_9:find("%a") and not (l_0_4:sub(l_0_10, l_0_10)):match("[/%.%w_%-%?#=&]") then
    (bm.trigger_sig)("BmTraverseTreeBlockMac", "Detected")
    return mp.INFECTED
  end
end
return mp.CLEAN

