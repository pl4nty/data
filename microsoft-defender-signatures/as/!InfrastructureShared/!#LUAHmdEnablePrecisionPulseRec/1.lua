-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAHmdEnablePrecisionPulseRec\1.luac 

-- params : ...
-- function num : 0
if (MpCommon.NidSearch)(mp.NID_ENABLE_EXTENDED_BAFS, 7) then
  local l_0_0 = "hmdprecisionpulse"
  local l_0_1 = "scan_counter"
  local l_0_2 = "max_scan"
  local l_0_3 = "run_tracker"
  local l_0_4 = 60
  local l_0_5 = 500
  local l_0_6 = (MpCommon.AtomicCounterValueNamespaced)(l_0_3, l_0_0)
  if l_0_6 ~= nil then
    return mp.CLEAN
  end
  local l_0_7 = (MpCommon.AtomicCounterValueNamespaced)(l_0_1, l_0_0)
  if l_0_7 == nil then
    (MpCommon.AtomicCounterSetNamespaced)(l_0_1, l_0_0, 0, l_0_4)
  end
  local l_0_8 = (MpCommon.AtomicCounterValueNamespaced)(l_0_2, l_0_0)
  if l_0_8 == nil then
    (MpCommon.AtomicCounterSetNamespaced)(l_0_2, l_0_0, l_0_5, l_0_4)
  end
  if l_0_6 == nil then
    pcall((MpCommon.AtomicCounterSetNamespaced)(l_0_3, l_0_0, 1, l_0_4))
  end
  local l_0_9 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.info"
  local l_0_10 = {}
  l_0_10[1] = l_0_9
  local l_0_11 = {}
  l_0_11.SIG_CONTEXT = "LUA_GENERIC"
  l_0_11.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
  l_0_11.TAG = "NOLOOKUP"
  local l_0_12, l_0_13 = pcall(mp.GetUrlReputation, l_0_10, l_0_11)
  if not l_0_12 or not l_0_13 or not l_0_13.urls then
    return mp.CLEAN
  end
  for l_0_17,l_0_18 in ipairs(l_0_13.urls) do
    if l_0_18.determination == 4 then
      local l_0_19 = l_0_18.urlresponsecontext
      local l_0_20 = ""
      if l_0_19 then
        for l_0_24,l_0_25 in ipairs(l_0_19) do
          local l_0_26 = l_0_25.key
          local l_0_27 = l_0_25.value
          if l_0_26 == "Payload" then
            do
              do
                l_0_20 = l_0_27
                EnablePrecisionPulse(l_0_20, "HmdEnablePrecisionPulseRecurring", l_0_0, l_0_1, l_0_2)
                do break end
                -- DECOMPILER ERROR at PC114: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC114: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC114: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
end
l_0_0 = mp
l_0_0 = l_0_0.CLEAN
return l_0_0

