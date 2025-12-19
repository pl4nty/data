-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b37c012ec4\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 then
  local l_0_0 = (this_sigattrlog[1]).utf8p1
  if not (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
    return mp.CLEAN
  end
  local l_0_1 = reportRelevantUntrustedEntities(0)
  if l_0_1 and next(l_0_1) then
    (bm.add_related_string)("UntrustedEntities", safeJsonSerialize(l_0_1), bm.RelatedStringBMReport)
  end
  local l_0_2 = add_parents()
  if l_0_2 then
    (bm.add_related_string)("Parents", safeJsonSerialize(l_0_2), bm.RelatedStringBMReport)
  end
  return mp.INFECTED
end
do
  return mp.CLEAN
end

