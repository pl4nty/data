-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ExtractedFromInterestingArchiveB\1.luac 

-- params : ...
-- function num : 0
do
  if not (mp.get_mpattribute)("BM_MZ_FILE") then
    local l_0_0 = (mp.get_mpattribute)("BM_CONTAINER_FILE")
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = nil
  if (mp.GetMOTWZone)() == nil or (mp.GetMOTWZone)() < 3 then
    return mp.CLEAN
  end
  local l_0_2 = nil
  if (mp.GetMOTWReferrerUrl)() == nil then
    return mp.CLEAN
  end
  local l_0_3 = normalize_path((mp.GetMOTWReferrerUrl)())
  local l_0_4 = "ArchiveTracker"
  local l_0_5, l_0_6 = , pcall(MpCommon.RollingQueueQueryKeyNamespaced, "InterestingZip.A", l_0_4, l_0_3)
  if l_0_6 and MpCommon.RollingQueueQueryKeyNamespaced ~= nil then
    (mp.set_mpattribute)("Lua:MotWFromIntZip")
    ;
    (mp.set_mpattribute)("Lua:MotWFromIntZip" .. "_" .. (MpCommon.RollingQueueQueryKeyNamespaced).value)
  end
  return mp.CLEAN
end

