-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\188b357da349a\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC52: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[3]).matched) and (this_sigattrlog[3]).utf8p2 ~= nil then
      local l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p2)
    else
    end
    -- DECOMPILER ERROR at PC88: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p2 == nil or (this_sigattrlog[5]).matched) and (this_sigattrlog[5]).utf8p2 ~= nil then
        local l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10 = (string.lower)((this_sigattrlog[4]).utf8p2)
      end
      -- DECOMPILER ERROR at PC89: Confused about usage of register: R0 in 'UnsetPending'

      -- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

      -- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

      if l_0_2 == nil or #l_0_2 < 4 or #l_0_2 > 20000 then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

      -- DECOMPILER ERROR at PC111: Confused about usage of register: R0 in 'UnsetPending'

      -- DECOMPILER ERROR at PC120: Confused about usage of register: R0 in 'UnsetPending'

      -- DECOMPILER ERROR at PC130: Confused about usage of register: R0 in 'UnsetPending'

      if (string.find)(l_0_2, "/cp /proc/", 1, true) or (string.find)(l_0_2, " cp /proc/", 1, true) or (string.find)(l_0_2, "cp /proc/", 1, true) == 1 then
        (bm.add_related_string)("file_metadata", l_0_2, bm.RelatedStringBMReport)
        addRelatedProcess()
        reportRelatedBmHits()
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

