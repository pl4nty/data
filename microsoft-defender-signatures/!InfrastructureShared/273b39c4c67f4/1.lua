-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\273b39c4c67f4\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 and (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 and (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 and (this_sigattrlog[4]).matched then
    local l_0_0, l_0_1 = (this_sigattrlog[4]).utf8p2
  end
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 then
    local l_0_2 = nil
    if isnull((string.match)(l_0_0, "Uri=([^;]+)")) then
      return mp.CLEAN
    end
    local l_0_3 = nil
    if (string.match)(l_0_3, "^https?://") then
      local l_0_4, l_0_5 = {SIG_CONTEXT = "BM", CONTENT_SOURCE = "QUE_SET_RE"}, (mp.CheckUrl)(l_0_3)
      if l_0_5 == 1 and l_0_3 == 1 then
        return mp.CLEAN
      end
      local l_0_6 = nil
      local l_0_7 = SafeGetUrlReputation
      l_0_7 = l_0_7({l_0_3}, l_0_4, false, 3000)
      if (l_0_7.urls)[l_0_3] and ((l_0_7.urls)[l_0_3]).determination == 2 and ((l_0_7.urls)[l_0_3]).confidence >= 60 then
        (bm.add_related_string)("MALICIOUS URL: ", l_0_3, bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    end
  end
  do
    return mp.CLEAN
  end
end

