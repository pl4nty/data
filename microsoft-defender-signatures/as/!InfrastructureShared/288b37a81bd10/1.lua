-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\288b37a81bd10\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC21: Overwrote pending register: R0 in 'AssignReg'

do
  -- DECOMPILER ERROR at PC22: Unhandled construct in 'MakeBoolean' P1

  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil and (this_sigattrlog[5]).utf8p2 ~= "" then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC67: Overwrote pending register: R0 in 'AssignReg'

  do
    -- DECOMPILER ERROR at PC68: Unhandled construct in 'MakeBoolean' P1

    if (not (this_sigattrlog[6]).matched or (this_sigattrlog[6]).utf8p2 ~= nil and (this_sigattrlog[6]).utf8p2 ~= "" and (this_sigattrlog[7]).matched) and (this_sigattrlog[7]).utf8p2 ~= nil and (this_sigattrlog[7]).utf8p2 ~= "" then
      local l_0_1, l_0_2, l_0_3, l_0_4 = (string.lower)((this_sigattrlog[6]).utf8p2)
    end
    -- DECOMPILER ERROR at PC93: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

    if (not (this_sigattrlog[8]).matched or (this_sigattrlog[8]).utf8p2 == nil or (this_sigattrlog[8]).utf8p2 == "" or (string.lower)((this_sigattrlog[8]).utf8p2) ~= nil) and (string.lower)((this_sigattrlog[8]).utf8p2) ~= "" and SuspMacPathsToMonitor((string.lower)((this_sigattrlog[8]).utf8p2), false) then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

