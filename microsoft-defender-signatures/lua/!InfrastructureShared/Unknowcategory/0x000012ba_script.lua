-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000012ba_luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[5]).ppid then
  return mp.CLEAN
end
local l_0_0 = ""
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
  l_0_0 = (MpCommon.PathToWin32Path)((string.lower)((this_sigattrlog[4]).utf8p1))
end
if l_0_0 == nil then
  return mp.CLEAN
end
;
(bm.add_related_string)("SuspSearchOrderExpl", tostring(l_0_0), bm.RelatedStringBMReport)
return mp.INFECTED

