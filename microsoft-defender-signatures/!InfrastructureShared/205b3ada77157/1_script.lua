-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\205b3ada77157\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
do
  if (this_sigattrlog[9]).matched then
    local l_0_1, l_0_2, l_0_3 = (this_sigattrlog[9]).utf8p2
  end
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  l_0_0 = (string.match)(l_0_1, "Uri=([^;]+)")
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_4 = nil
  local l_0_5, l_0_6 = {SIG_CONTEXT = "LummaC2_lolbin", CONTENT_SOURCE = "BM", TAG = "INTERFLOW"}, (mp.CheckUrl)(l_0_0)
  if l_0_6 == 1 and l_0_0 == 1 then
    return mp.CLEAN
  end
  local l_0_7 = nil
  local l_0_8 = SafeGetUrlReputation
  l_0_8 = l_0_8({l_0_0}, l_0_5, false, 2000)
  if (l_0_8.urls)[l_0_0] and ((l_0_8.urls)[l_0_0]).determination == 2 then
    return mp.INFECTED
  end
  if (l_0_8.urls)[l_0_0] and ((l_0_8.urls)[l_0_0]).determination then
    if ((l_0_8.urls)[l_0_0]).determination == 1 then
      return mp.CLEAN
    end
    if ((l_0_8.urls)[l_0_0]).determination == 4 then
      return mp.CLEAN
    end
    ;
    (bm.trigger_sig)("LummaC2_lolbin_All_1", tostring(((l_0_8.urls)[l_0_0]).determination))
  end
  return mp.CLEAN
end

