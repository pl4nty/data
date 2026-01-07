-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3f6b0122e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "1bb146aa"
if (this_sigattrlog[1]).matched and not isnull((this_sigattrlog[1]).utf8p2) then
  local l_0_1 = safeJsonDeserialize((this_sigattrlog[1]).utf8p2)
  local l_0_2 = "app_ext_" .. l_0_1.Extension
  local l_0_3 = (MpCommon.AtomicCounterValueExNamespaced)(l_0_2, l_0_0)
  if l_0_3 ~= nil then
    l_0_1.ACDelayedFilesEncrypted = l_0_3.count
    l_0_1.ACDelayedCreationTime = l_0_3.insert_time
    l_0_1.ACDelayedExpirationTime = l_0_3.expire_time
    l_0_1.ACDelayedRecentTime = l_0_3.update_time
    local l_0_4 = (MpCommon.AtomicCounterValueNamespaced)("rcount_sig_count", l_0_0)
    if l_0_4 ~= nil then
      l_0_1.SigCounter = l_0_4
    else
      l_0_1.SigCounter = 0
    end
    local l_0_5 = safeJsonSerialize(l_0_1)
    local l_0_6 = SafeGetUrlReputation
    local l_0_7 = {}
    -- DECOMPILER ERROR at PC52: No list found for R7 , SetList fails

    local l_0_8 = {}
    l_0_8.SIG_CONTEXT = "BM"
    l_0_8.CONTEXT_SOURCE = "GenRansomData3"
    l_0_8.TAG = "NOLOOKUP"
    l_0_8.data = l_0_5
    l_0_6 = l_0_6(l_0_7, l_0_8, false, 3000, false)
    if l_0_6 then
      l_0_7 = l_0_6.error
      if l_0_7 == 3 then
        l_0_1.CRReportError = "Failed the first attempt"
        l_0_7 = SafeGetUrlReputation
        local l_0_9 = {}
        l_0_9.SIG_CONTEXT = "BM"
        l_0_9.CONTEXT_SOURCE = "GenRansomData3"
        l_0_9.TAG = "NOLOOKUP"
        l_0_9.data = l_0_5
        l_0_7, l_0_8 = l_0_7(l_0_8, l_0_9, false, 3000, false), {l_0_1.ip}
        l_0_6 = l_0_7
      end
    end
  end
end
do
  return mp.CLEAN
end

