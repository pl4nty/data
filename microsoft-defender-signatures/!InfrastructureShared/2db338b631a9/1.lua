-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2db338b631a9\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6 = nil
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0:find("tel:", 1, true) or l_0_0:find("alf:acse.", 1, true) or l_0_0:find("telper:", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC48: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0:find("cmdlineml", 1, true) or l_0_0:find("!ml", 1, true) or l_0_0:find("low:hstr", 1, true) then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM("BM", "TCmdLowfi", "CmdLowfiParent")
  return mp.INFECTED
end

