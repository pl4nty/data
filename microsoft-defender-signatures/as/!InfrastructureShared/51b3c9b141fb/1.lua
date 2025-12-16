-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\51b3c9b141fb\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1, l_0_2 = (l_0_0.ppid):byte(5, 6)
-- DECOMPILER ERROR at PC16: Unhandled construct in 'MakeBoolean' P1

if l_0_1 == 52 and l_0_2 == 44 and l_0_0.ppid ~= nil then
  local l_0_3 = "1bb146aa"
  local l_0_4 = (bm.get_sig_count)()
  local l_0_5 = (MpCommon.AtomicCounterValueNamespaced)("rcount_sig_count", l_0_3)
  if not l_0_5 then
    (MpCommon.AtomicCounterSetNamespaced)("rcount_sig_count", l_0_3, l_0_4, 36000)
  else
    ;
    (MpCommon.AtomicCounterAddNamespaced)("rcount_sig_count", l_0_3, 1)
  end
  local l_0_6 = (this_sigattrlog[1]).utf8p2
  local l_0_7 = (this_sigattrlog[1]).utf8p1
  if #l_0_6 < #l_0_7 and l_0_7:find(l_0_6, 1, true) == 1 and l_0_7:byte(#l_0_6 + 1) ~= 58 then
    local l_0_8 = (string.sub)(l_0_7, #l_0_6 + 1)
    local l_0_9 = "app_ext_" .. l_0_8
    local l_0_10 = (MpCommon.AtomicCounterValueNamespaced)(l_0_9, l_0_3)
    if not l_0_10 then
      (MpCommon.AtomicCounterSetNamespaced)(l_0_9, l_0_3, 1, 36000)
    else
      ;
      (MpCommon.AtomicCounterAddNamespaced)(l_0_9, l_0_3, 1)
    end
  end
  do
    local l_0_11 = (this_sigattrlog[2]).utf8p2
    local l_0_12 = (this_sigattrlog[2]).utf8p1
    if #l_0_11 < #l_0_12 and l_0_12:find(l_0_11, 1, true) == 1 and l_0_12:byte(#l_0_11 + 1) ~= 58 then
      local l_0_13 = (string.sub)(l_0_12, #l_0_11 + 1)
      local l_0_14 = "app_ext_" .. l_0_13
      local l_0_15 = (MpCommon.AtomicCounterValueNamespaced)(l_0_14, l_0_3)
      if not l_0_15 then
        (MpCommon.AtomicCounterSetNamespaced)(l_0_14, l_0_3, 1, 36000)
      else
        ;
        (MpCommon.AtomicCounterAddNamespaced)(l_0_14, l_0_3, 1)
      end
    end
    do
      local l_0_16 = (this_sigattrlog[3]).utf8p2
      local l_0_17 = (this_sigattrlog[3]).utf8p1
      if #l_0_16 < #l_0_17 and l_0_17:find(l_0_16, 1, true) == 1 and l_0_17:byte(#l_0_16 + 1) ~= 58 then
        local l_0_18 = (string.sub)(l_0_17, #l_0_16 + 1)
        local l_0_19 = "app_ext_" .. l_0_18
        local l_0_20 = (MpCommon.AtomicCounterValueNamespaced)(l_0_19, l_0_3)
        if not l_0_20 then
          (MpCommon.AtomicCounterSetNamespaced)(l_0_19, l_0_3, 1, 36000)
        else
          ;
          (MpCommon.AtomicCounterAddNamespaced)(l_0_19, l_0_3, 1)
        end
      end
      do
        ;
        (bm.DisableSignature)()
        return mp.CLEAN
      end
    end
  end
end

