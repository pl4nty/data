-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\62b3ba403338\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "INETShortcutUrlWithAssemblyLaunch"
if not (this_sigattrlog[1]).matched or not (this_sigattrlog[2]).matched or not (this_sigattrlog[3]).matched then
  return mp.CLEAN
end
local l_0_1 = (this_sigattrlog[1]).utf8p1
local l_0_2 = (this_sigattrlog[1]).utf8p2
local l_0_3 = (this_sigattrlog[2]).utf8p1
local l_0_4 = (this_sigattrlog[3]).utf8p1
if isnull(l_0_1) or isnull(l_0_2) or isnull(l_0_3) or isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = l_0_1:match("!(.+)")
if isnull(l_0_5) then
  return mp.CLEAN
end
local l_0_6 = (string.lower)(l_0_3)
if (string.lower)(l_0_2) ~= l_0_6 or l_0_6 ~= (string.lower)(l_0_4) then
  return mp.CLEAN
end
local l_0_7 = (MpCommon.PathToWin32Path)(l_0_5)
local l_0_8 = (MpCommon.PathToWin32Path)(l_0_2)
if isnull(l_0_8) then
  return mp.CLEAN
end
l_0_8 = (mp.ContextualExpandEnvironmentVariables)(l_0_8)
if isnull(l_0_8) or (mp.IsKnownFriendlyFile)(l_0_8, true, false) then
  return mp.CLEAN
end
local l_0_9 = safeJsonSerialize
local l_0_10 = {}
l_0_10.Source = l_0_0
l_0_10.UrlPath = l_0_7
l_0_10.AssemblyPath = l_0_8
l_0_9 = l_0_9(l_0_10)
l_0_10 = bm
l_0_10 = l_0_10.add_related_string
l_0_10(l_0_0, l_0_9, bm.RelatedStringBMReport)
l_0_10 = mp
l_0_10 = l_0_10.INFECTED
return l_0_10

