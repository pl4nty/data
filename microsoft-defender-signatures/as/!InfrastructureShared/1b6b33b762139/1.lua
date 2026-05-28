-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1b6b33b762139\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[3]).matched or not (this_sigattrlog[4]).matched then
  return mp.CLEAN
end
if not IsBasToolProcessForPpid("BM", "AttackIQ") and not IsBasToolProcessFoundInParents("BM", "AttackIQ", 4) then
  return mp.CLEAN
end
do
  if (this_sigattrlog[3]).utf8p2 ~= nil then
    local l_0_0 = (string.lower)((this_sigattrlog[3]).utf8p2)
    if not (string.find)(l_0_0, "/format:", 1, true) then
      return mp.CLEAN
    end
    ;
    (bm.add_related_string)("aiq_xsl_wmic", l_0_0, bm.RelatedStringBMReport)
  end
  add_parents()
  return mp.INFECTED
end

