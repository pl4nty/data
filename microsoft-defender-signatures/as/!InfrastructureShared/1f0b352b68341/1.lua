-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1f0b352b68341\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[5]).matched then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4 = nil
  else
  end
  if not (this_sigattrlog[6]).matched or not (this_sigattrlog[6]).utf8p1 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

  if IsKeyInRollingQueue("AVExclusions", (this_sigattrlog[6]).utf8p1) then
    AppendToRollingQueue("AVExclusions", (this_sigattrlog[6]).utf8p1, "", 1, 1000)
  end
  return mp.CLEAN
end

