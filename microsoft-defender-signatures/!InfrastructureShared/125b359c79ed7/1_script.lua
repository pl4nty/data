-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\125b359c79ed7\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
    local l_0_0, l_0_1, l_0_3, l_0_5 = nil, nil, nil
  else
  end
  do
    if (not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 == "" or (this_sigattrlog[4]).matched) and (this_sigattrlog[4]).utf8p1 ~= nil and (this_sigattrlog[4]).utf8p1 ~= "" then
      local l_0_2, l_0_4, l_0_6 = (this_sigattrlog[3]).utf8p2, (this_sigattrlog[4]).utf8p1
    end
    do
      if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil and (this_sigattrlog[5]).utf8p2 ~= "" then
        local l_0_7 = nil
      end
      -- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

      if not SuspMacPathsToMonitor(l_0_4, true) then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC82: Confused about usage of register: R1 in 'UnsetPending'

      local l_0_8 = nil
      if l_0_4:match("[^/]*$") == nil or l_0_4:match("[^/]*$") == "" then
        return mp.CLEAN
      end
      if (string.find)((this_sigattrlog[5]).utf8p2, l_0_4:match("[^/]*$"), 1, true) and (string.find)(l_0_8, l_0_4:match("[^/]*$"), 1, true) then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

