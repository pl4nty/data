-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb3cb10d11b\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC52: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[1]).matched or not (this_sigattrlog[1]).utf8p2 or (this_sigattrlog[2]).matched) and (this_sigattrlog[2]).utf8p2 then
      local l_0_1 = reportGenericRansomware((this_sigattrlog[1]).utf8p2, true)
    end
    -- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_1 == mp.INFECTED then
      reportSessionInformation()
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

