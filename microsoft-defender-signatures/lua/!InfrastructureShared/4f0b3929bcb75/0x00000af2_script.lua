-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4f0b3929bcb75\0x00000af2_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[22]).matched and (this_sigattrlog[22]).utf8p1 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5 = nil
  else
  end
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

  if not (this_sigattrlog[23]).matched or (this_sigattrlog[23]).utf8p1 == nil or (this_sigattrlog[23]).utf8p1 ~= nil then
    taint((this_sigattrlog[23]).utf8p1, "remote_file_created_taint", 3600)
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (bm.trigger_sig)("SuspRemoteFileCopy", (this_sigattrlog[23]).utf8p1)
    return mp.INFECTED
  end
  return mp.CLEAN
end

