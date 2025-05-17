-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\75b3d29be255\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = reportAVExcludedEntities()
if next(l_0_0) then
  (bm.add_related_string)("Exclusion_API", "sysio", bm.RelatedStringBMReport)
  return mp.INFECTED
end
local l_0_1 = (MpCommon.PathToWin32Path)((bm.get_imagepath)())
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = IsAVExcluded(l_0_1)
if l_0_2 then
  (bm.add_related_string)("Exclusion_API", "LUA", bm.RelatedStringBMReport)
  if l_0_3 then
    (bm.add_related_string)("Effective_Exclusion", l_0_3, bm.RelatedStringBMReport)
  end
  return mp.INFECTED
end
return mp.CLEAN

