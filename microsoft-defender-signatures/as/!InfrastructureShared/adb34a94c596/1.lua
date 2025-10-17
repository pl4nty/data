-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb34a94c596\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil and (this_sigattrlog[1]).utf8p2 ~= "" then
    local l_0_0 = nil
  end
  local l_0_2 = nil
  -- DECOMPILER ERROR at PC36: Overwrote pending register: R1 in 'AssignReg'

  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
    local l_0_1 = nil
    -- DECOMPILER ERROR at PC39: Overwrote pending register: R2 in 'AssignReg'

  else
    do
      -- DECOMPILER ERROR at PC61: Overwrote pending register: R2 in 'AssignReg'

      -- DECOMPILER ERROR at PC83: Overwrote pending register: R2 in 'AssignReg'

      -- DECOMPILER ERROR at PC88: Confused about usage of register: R1 in 'UnsetPending'

      -- DECOMPILER ERROR at PC90: Confused about usage of register: R1 in 'UnsetPending'

      -- DECOMPILER ERROR at PC100: Unhandled construct in 'MakeBoolean' P3

      -- DECOMPILER ERROR at PC100: Unhandled construct in 'MakeBoolean' P3

      if (((this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" and not (this_sigattrlog[4]).matched) or l_0_2 ~= nil) and l_0_2 ~= "" and (this_sigattrlog[4]).utf8p2 ~= nil and (this_sigattrlog[4]).utf8p2 ~= "" and "" ~= "" then
        (bm.add_related_string)("SuspAttrMatch", l_0_2, bm.RelatedStringBMReport)
        -- DECOMPILER ERROR at PC104: Confused about usage of register: R2 in 'UnsetPending'

        ;
        (bm.add_related_string)("SuspMatchType", "", bm.RelatedStringBMReport)
        -- DECOMPILER ERROR at PC110: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (bm.add_related_file)((this_sigattrlog[4]).utf8p2)
        reportRelatedBmHits()
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

