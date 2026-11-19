-- Threat: !InfrastructureShared
-- Name: 15bb3d4e68a83
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_3 = string.lower(this_sigattrlog[3].utf8p2)
end
if l_0_3 == "" or l_0_3 == nil or 150 < #l_0_3 or string.find(l_0_3, "github.com", 1, true) or string.find(l_0_3, "youtube.com", 1, true) then
  return mp.CLEAN
end
local l_0_4 = " " .. l_0_3 .. " "
local l_0_5 = l_0_4:match("%s%-%a*o%s+(%S+)") or l_0_4:match("%s%-%-output[%s=]+(%S+)")
if l_0_5 ~= nil and l_0_5 ~= "" then
  l_0_5 = l_0_5:gsub("[\"']", "")
  if l_0_5 ~= "-" and l_0_5 ~= "/dev/stdout" and l_0_5 ~= "/dev/fd/1" then
    return mp.CLEAN
  end
end
for l_0_6, l_0_7, l_0_8 in l_0_3:gmatch("https?://[%w%.%-:]+/(%w+)/(%w+)()") do
  if 4 <= #l_0_6 and #l_0_6 <= 8 and l_0_6:match("^[%l%d]+$") and 10 <= #l_0_7 and #l_0_7 <= 16 and l_0_7:find("%d") and l_0_7:find("%a") and not l_0_3:sub(l_0_8, l_0_8):match("[/%.%w_%-%?#=&]") then
    bm.trigger_sig("BmTraverseTreeBlockMac", "Detected")
    return mp.INFECTED
  end
end
return mp.CLEAN
