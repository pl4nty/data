-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb35abd4e6e\0x0000053d_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[3]).matched then
  local l_0_0, l_0_1, l_0_2 = nil
else
  do
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_0 == nil or (string.len)(l_0_0) == 0 then
      return mp.CLEAN
    end
    local l_0_3 = nil
    for l_0_7 in l_0_3:gmatch("([^\r\n]*)\n?") do
      local l_0_4 = false
      -- DECOMPILER ERROR at PC30: Confused about usage of register: R5 in 'UnsetPending'

      R5_PC30 = (mp.ContextualExpandEnvironmentVariables)(R5_PC30)
      if (sysio.IsFileExists)(R5_PC30) and (mp.IsKnownFriendlyFile)(R5_PC30, true, false) == false then
        (bm.add_threat_file)(R5_PC30)
        l_0_4 = true
      end
    end
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

    if l_0_4 == true then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

