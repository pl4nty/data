-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\121b3ce12b8c0\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[4]).matched then
  return mp.CLEAN
end
if not (this_sigattrlog[5]).matched then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[4]).utf8p1
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (this_sigattrlog[5]).utf8p1
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_0 = (MpCommon.PathToWin32Path)(l_0_0)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
l_0_1 = (string.lower)(l_0_1)
if (string.sub)(l_0_0, 1, 4) == "\\\\?\\" then
  l_0_0 = (string.sub)(l_0_0, 5)
end
if (string.sub)(l_0_1, 1, 4) == "\\\\?\\" then
  l_0_1 = (string.sub)(l_0_1, 5)
end
local l_0_2 = l_0_0:match("^(.*\\)[^\\]+$")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_1:match("^(.*\\)[^\\]+$")
if l_0_3 == nil then
  return mp.CLEAN
end
if l_0_2 ~= l_0_3 then
  return mp.CLEAN
end
if (mp.IsKnownFriendlyFile)(l_0_1, true, false) then
  return mp.CLEAN
end
local l_0_4, l_0_5, l_0_6 = IsFileRecentlyDropped(l_0_1)
if not l_0_4 then
  return mp.CLEAN
end
if not l_0_5 or not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = safeJsonDeserialize(l_0_6)
if type(l_0_7) ~= "table" then
  return mp.CLEAN
end
if l_0_7.UnsignedFile ~= true then
  return mp.CLEAN
end
add_parents()
return mp.INFECTED

