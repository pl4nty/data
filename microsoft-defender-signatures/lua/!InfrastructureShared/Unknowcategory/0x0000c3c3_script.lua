-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x0000c3c3_luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1, l_1_2 = l_1_0:match("(.-)([^\\/]-%.?[^%.\\/]*)$")
  return l_1_1:lower(), l_1_2:lower()
end

local l_0_1 = (MpCommon.PathToWin32Path)((bm.get_imagepath)())
if l_0_1 == nil then
  return mp.CLEAN
else
  l_0_1 = (string.lower)(l_0_1)
end
if (string.find)(l_0_1, "\\svchost.exe", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\filecoauth.exe", 1, true) then
  return mp.CLEAN
end
if (this_sigattrlog[8]).matched and (this_sigattrlog[6]).matched and (this_sigattrlog[8]).utf8p1 ~= nil and (this_sigattrlog[8]).utf8p2 ~= nil and (this_sigattrlog[6]).utf8p2 ~= nil then
  local l_0_2 = (string.lower)((this_sigattrlog[8]).utf8p1)
  local l_0_3 = (string.lower)((this_sigattrlog[8]).utf8p2)
  local l_0_4, l_0_5 = l_0_0(l_0_1)
  local l_0_6, l_0_7 = l_0_0((this_sigattrlog[6]).utf8p2)
  local l_0_8, l_0_9 = l_0_0(l_0_2)
  local l_0_10, l_0_11 = l_0_0(l_0_3)
  if (string.find)(l_0_2, l_0_4, 1, true) and (string.find)(l_0_3, l_0_6, 1, true) and l_0_9 ~= l_0_11 and (sysio.IsFileExists)(l_0_3) and (mp.IsKnownFriendlyFile)(l_0_3, false, false) == false then
    (bm.add_related_file)(l_0_3)
  end
end
do
  ;
  (bm.trigger_sig_self_propagate)("SuspSlugResinProcessLaunch", "Behavior:Win32/SnailResin.A!dha")
  return mp.INFECTED
end

