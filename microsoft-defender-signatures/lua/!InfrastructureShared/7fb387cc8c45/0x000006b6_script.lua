-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7fb387cc8c45\0x000006b6_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R1 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_1, l_0_4 = nil, nil
    local l_0_0, l_0_3 = nil
  end
  do
    if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
      local l_0_2, l_0_5 = l_0_1
    end
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

    if l_0_2 == nil or (string.match)((this_sigattrlog[2]).utf8p2, "TargetPPID:(%d+):") == nil or l_0_5 == nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC51: Confused about usage of register: R2 in 'UnsetPending'

    local l_0_6, l_0_7 = nil
    if pcall(mp.GetPPidFromPid, (string.match)((this_sigattrlog[2]).utf8p2, "TargetPPID:(%d+):")) == false or mp.GetPPidFromPid == nil then
      return mp.CLEAN
    end
    if IsPEBSpoofed(R6_PC64, l_0_7, l_0_6) == true then
      R6_PC64 = mp
      R6_PC64 = R6_PC64.INFECTED
      return R6_PC64
    end
    R6_PC64 = mp
    R6_PC64 = R6_PC64.CLEAN
    return R6_PC64
  end
end

