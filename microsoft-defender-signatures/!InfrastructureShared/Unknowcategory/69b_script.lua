-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\69b_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
local l_0_1 = ""
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  l_0_1 = (MpCommon.PathToWin32Path)((string.lower)((this_sigattrlog[1]).utf8p2))
end
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
  l_0_0 = (MpCommon.PathToWin32Path)((string.lower)((this_sigattrlog[2]).utf8p1))
end
if l_0_0 == nil or l_0_0 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
;
(bm.add_related_string)("SyncAppvPublishingServerParent", tostring(l_0_0), bm.RelatedStringBMReport)
;
(bm.add_related_string)("SyncAppvPublishingServerArgs", tostring(l_0_1), bm.RelatedStringBMReport)
return mp.INFECTED

