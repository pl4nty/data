-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1ecb3466e515a\1_luac 

-- params : ...
-- function num : 0
do
  if ((((this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p2) or ((this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p2) or ((this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p2) or (this_sigattrlog[10]).matched)) then
    local l_0_0, l_0_1 = (this_sigattrlog[10]).utf8p2
  end
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 then
    local l_0_2 = nil
    if not (string.match)(l_0_0, "Uri=([^;]+)") then
      return mp.CLEAN
    end
    local l_0_3 = nil
    if (string.match)(l_0_3, "^https?://") then
      local l_0_4 = {SIG_CONTEXT = "BM", CONTENT_SOURCE = "SUSPCOLORPL-C"}
      local l_0_5 = SafeGetUrlReputation
      l_0_5 = l_0_5({l_0_3}, l_0_4, false, 3000)
      if (l_0_5.urls)[l_0_3] and ((l_0_5.urls)[l_0_3]).determination == 2 and ((l_0_5.urls)[l_0_3]).confidence >= 60 then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
  do
    return mp.CLEAN
  end
end

