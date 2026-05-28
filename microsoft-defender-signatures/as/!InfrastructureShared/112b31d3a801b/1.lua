-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\112b31d3a801b\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[3]).matched then
  return mp.CLEAN
end
if not (this_sigattrlog[4]).matched then
  return mp.CLEAN
end
if not IsBasToolProcessForPpid("BM", "AttackIQ") and not IsBasToolProcessFoundInParents("BM", "AttackIQ", 4) then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if isnull(l_0_0) then
  return mp.CLEAN
end
;
(bm.add_related_string)("aiq_msxsl_proc", (string.lower)(l_0_0), bm.RelatedStringBMReport)
add_parents()
return mp.INFECTED

