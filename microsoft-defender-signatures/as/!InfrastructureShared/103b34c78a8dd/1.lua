-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\103b34c78a8dd\1.luac 

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
local l_0_3, l_0_4 = nil, nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).utf8p1 ~= "" then
  l_0_3 = (this_sigattrlog[2]).utf8p2
  l_0_4 = (this_sigattrlog[2]).utf8p1
else
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" and (this_sigattrlog[3]).utf8p1 ~= nil and (this_sigattrlog[3]).utf8p1 ~= "" then
    l_0_3 = (this_sigattrlog[3]).utf8p2
    l_0_4 = (this_sigattrlog[3]).utf8p1
  else
    if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil and (this_sigattrlog[4]).utf8p2 ~= "" and (this_sigattrlog[4]).utf8p1 ~= nil and (this_sigattrlog[4]).utf8p1 ~= "" then
      l_0_3 = (this_sigattrlog[4]).utf8p2
      l_0_4 = (this_sigattrlog[4]).utf8p1
    end
  end
end
if l_0_3 == nil or l_0_3 == "" or l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
if l_0_4:find("/bin/bash", 1, true) == nil and l_0_4:find("/bin/sh", 1, true) == nil and l_0_4:find("/bin/zsh", 1, true) == nil then
  return mp.CLEAN
end
if is_valid_ip(l_0_3) and ((string.find)(l_0_3, "/bin/bash", 1, true) or (string.find)(l_0_3, "/bin/zsh", 1, true) or (string.find)(l_0_3, "/bin/sh", 1, true) or l_0_3:match("\'(bash)\'") or l_0_3:match("\"(bash)\"") or l_0_3:match("\'(sh)\'") or l_0_3:match("\"(sh)\"") or l_0_3:match("\'(zsh)\'") or l_0_3:match("\"(zsh)\"") or l_0_3:find(" bash ", 1, true) or l_0_3:find(" sh ", 1, true) or l_0_3:find(" zsh ", 1, true) or l_0_3:find("zsh -i", 1, true) or l_0_3:find("bash -i", 1, true) or l_0_3:find("sh -i", 1, true) or l_0_3:find("do%s+%$", 1, false)) then
  (bm.trigger_sig)("GenericReverseShell", l_0_0, l_0_1.ppid)
  return mp.INFECTED
end
return mp.CLEAN

