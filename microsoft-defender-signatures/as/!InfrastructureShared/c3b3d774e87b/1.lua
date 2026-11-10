-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c3b3d774e87b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
  l_0_3 = (string.lower)((this_sigattrlog[2]).utf8p1)
end
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4, l_0_5 = l_0_3:match("^/users/[^/]+/library/(.*)/([^/]+)%.app/contents/macos/[^/]+$")
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_6 = {}
l_0_6.finder = true
l_0_6["software update"] = true
l_0_6["system settings"] = true
l_0_6["system preferences"] = true
l_0_6.systemuiserver = true
l_0_6.dock = true
l_0_6.safari = true
l_0_6.spotlight = true
l_0_6.keychain = true
if l_0_6[l_0_5] or l_0_4:find("com%.apple%.") then
  return mp.INFECTED
end
return mp.CLEAN

