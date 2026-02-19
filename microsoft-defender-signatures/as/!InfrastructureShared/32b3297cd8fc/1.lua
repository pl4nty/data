-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3297cd8fc\1.luac 

-- params : ...
-- function num : 0
if isnull(this_sigattrlog[1]) or isnull((this_sigattrlog[1]).utf8p2) then
  return mp.CLEAN
end
local l_0_0, l_0_1 = (string.match)((this_sigattrlog[1]).utf8p2, "Config=(.-);Assembly=(.+)")
if isnull(l_0_0) or isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (mp.ContextualExpandEnvironmentVariables)((MpCommon.PathToWin32Path)(l_0_1) or "")
if isnull(l_0_1) or (mp.IsKnownFriendlyFile)(l_0_1, true, false) then
  return mp.CLEAN
end
local l_0_2 = (bm.get_imagepath)()
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = (MpCommon.PathToWin32Path)(l_0_2)
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = (mp.ContextualExpandEnvironmentVariables)(l_0_2)
if isnull(l_0_2) or not (mp.IsKnownFriendlyFile)(l_0_2, true, false) then
  return mp.CLEAN
end
;
(bm.add_related_file)(l_0_0)
;
(bm.add_related_file)(l_0_1)
;
(bm.add_related_string)("SuspiciousAppDomainAssembly", (this_sigattrlog[1]).utf8p2, bm.RelatedStringBMReport)
return mp.INFECTED

