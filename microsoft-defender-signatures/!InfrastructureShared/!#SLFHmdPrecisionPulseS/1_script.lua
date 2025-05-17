-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFHmdPrecisionPulseS\1_luac 

-- params : ...
-- function num : 0
if (MpCommon.NidSearch)(mp.NID_ENABLE_EXTENDED_BAFS, 7) then
  local l_0_0 = "hmdprecisionpulse"
  local l_0_1 = "scan_counter"
  local l_0_2 = "max_scan"
  local l_0_3 = 60
  local l_0_4 = 500
  local l_0_5 = (MpCommon.AtomicCounterValueNamespaced)(l_0_1, l_0_0)
  if l_0_5 == nil then
    (MpCommon.AtomicCounterSetNamespaced)(l_0_1, l_0_0, 0, l_0_3)
    l_0_5 = 0
  end
  local l_0_6 = (MpCommon.AtomicCounterValueNamespaced)(l_0_2, l_0_0)
  if l_0_6 == nil then
    (MpCommon.AtomicCounterSetNamespaced)(l_0_2, l_0_0, l_0_4, l_0_3)
    l_0_6 = l_0_4
  end
  if l_0_6 <= l_0_5 then
    return mp.CLEAN
  end
  local l_0_7, l_0_8 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_7 == nil or l_0_8 == nil then
    return mp.CLEAN
  end
  l_0_8 = (split(l_0_8, "->"))[1]
  if (string.sub)(l_0_7, 0, 4) == "\\\\?\\" then
    l_0_7 = (string.sub)(l_0_7, 5)
  end
  local l_0_9 = split(l_0_7, "\\")
  if l_0_9[2] == nil then
    return mp.CLEAN
  end
  local l_0_10, l_0_11 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulsefolderscan", l_0_0, l_0_7)
  if l_0_10 and l_0_11 then
    (mp.set_mpattribute)("MpNonPIIFileType")
    if l_0_6 <= (MpCommon.AtomicCounterAddNamespaced)(l_0_1, l_0_0, 1) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
  local l_0_12, l_0_13 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulsefullfilepathscan", l_0_0, l_0_7 .. "\\" .. l_0_8)
  if l_0_12 and l_0_13 then
    (mp.set_mpattribute)("MpNonPIIFileType")
    if l_0_6 <= (MpCommon.AtomicCounterAddNamespaced)(l_0_1, l_0_0, 1) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
  local l_0_14, l_0_15 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulsescanfile", l_0_0, l_0_8)
  if l_0_14 and l_0_15 then
    (mp.set_mpattribute)("MpNonPIIFileType")
    if l_0_6 <= (MpCommon.AtomicCounterAddNamespaced)(l_0_1, l_0_0, 1) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end
do
  return mp.CLEAN
end

