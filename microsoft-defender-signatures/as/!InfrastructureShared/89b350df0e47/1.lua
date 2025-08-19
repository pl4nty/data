-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\89b350df0e47\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.command_line
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
  l_0_3 = (this_sigattrlog[2]).utf8p2
else
  return mp.CLEAN
end
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if not is_valid_ip(l_0_2) then
  return mp.CLEAN
end
if (string.find)(l_0_3, "/bin/bash", 1, true) or (string.find)(l_0_3, "/bin/zsh", 1, true) or (string.find)(l_0_3, "/bin/sh", 1, true) or l_0_3:match("\'bash\'") or l_0_3:match("\"bash\"") or l_0_3:match("\'sh\'") or l_0_3:match("\"sh\"") or l_0_3:match("\'zsh\'") or l_0_3:match("\"zsh\"") or l_0_3:find("zsh -i", 1, true) or l_0_3:find("bash -i", 1, true) or l_0_3:find("sh -i", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

