-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\5de_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[15]).matched and (this_sigattrlog[15]).utf8p1 ~= nil then
  l_0_0 = (MpCommon.PathToWin32Path)((string.lower)((this_sigattrlog[15]).utf8p1))
end
if l_0_0 == nil then
  return mp.CLEAN
end
;
(bm.add_related_string)("SuspSearchOrderExpl_B", tostring(l_0_0), bm.RelatedStringBMReport)
return mp.INFECTED

