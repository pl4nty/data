-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1e8b3300f6ecb\0x00000a55_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5 = nil
  else
  end
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC33: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

  if (not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[2]).utf8p2 ~= "") and (this_sigattrlog[2]).utf8p2 ~= nil and (sysio.IsFileExists)((this_sigattrlog[2]).utf8p2) then
    (bm.trigger_sig)("DataCollectionFromScriptInSuspLocation", (this_sigattrlog[2]).utf8p2)
    return mp.INFECTED
  end
  return mp.CLEAN
end

