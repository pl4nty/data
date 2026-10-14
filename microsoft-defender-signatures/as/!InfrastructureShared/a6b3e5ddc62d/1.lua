-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a6b3e5ddc62d\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched then
    local l_0_0, l_0_1, l_0_2 = nil
  else
  end
  if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_3 = (string.lower)((this_sigattrlog[3]).utf8p2)
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC31: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC32: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC33: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC34: Overwrote pending register: R4 in 'AssignReg'

  if not ("\\mozilla\\firefox\\")("\\microsoft\\edge\\", "\\google\\chrome\\") then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM("BM", "T1555.003", "rundll32_firefox_credaccess")
  return mp.INFECTED
end

