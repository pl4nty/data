-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\129b31e47029b\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC52: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[6]).matched or (this_sigattrlog[6]).utf8p2 == nil or (this_sigattrlog[7]).matched) and (this_sigattrlog[7]).utf8p2 ~= nil then
      local l_0_1, l_0_2, l_0_3, l_0_4, l_0_5 = (string.lower)((this_sigattrlog[6]).utf8p2)
    end
    -- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_1 == nil or l_0_1 == "" then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC63: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (bm.add_related_string)("file_metadata", l_0_1, bm.RelatedStringBMReport)
    addRelatedProcess()
    reportRelatedBmHits()
    return mp.INFECTED
  end
end

