-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b345fbb5fd\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R1 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    local l_0_2, l_0_4, l_0_6 = nil, nil
  end
  do
    if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
      local l_0_0, l_0_1, l_0_3, l_0_5 = (this_sigattrlog[3]).utf8p1
    end
    -- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

    if l_0_0 ~= nil and l_0_0 ~= "" and l_0_1 ~= nil and l_0_1 ~= "" then
      local l_0_7 = nil
      local l_0_8, l_0_9 = nil
      local l_0_10 = (l_0_1:match("([^/\\]+)$")):match("^(.*)(%.[^%.]+)$")
      local l_0_11, l_0_12 = nil
      -- DECOMPILER ERROR at PC66: Unhandled construct in 'MakeBoolean' P1

      if (l_0_7:match("([^/\\]+)$")):match("^(.*)(%.[^%.]+)$") or l_0_7:match("([^/\\]+)$") ~= ".cpt" and isKnownRansomExtension(R9_PC52) and (l_0_12 == l_0_9 or l_0_12 == l_0_10 or StringStartsWith(R9_PC52, l_0_12)) then
        addRelatedProcess()
        reportRelatedBmHits()
        return mp.INFECTED
      end
    end
    do
      return mp.CLEAN
    end
  end
end

