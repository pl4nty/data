-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\22eb38f3f2989\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p1 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11 = nil
  else
  end
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC48: Confused about usage of register: R0 in 'UnsetPending'

  if (not (this_sigattrlog[11]).matched or (this_sigattrlog[11]).utf8p1 == nil or (this_sigattrlog[11]).utf8p1 ~= nil) and (isTainted((this_sigattrlog[11]).utf8p1, "new_script_file_created_hint") or isTainted((this_sigattrlog[11]).utf8p1, "new_archive_file_created_hint") or isTainted((this_sigattrlog[11]).utf8p1, "new_elf_file_created_hint")) then
    taint((this_sigattrlog[11]).utf8p1, "remote_file_created_taint", 3600)
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (mp.ReportLowfi)((this_sigattrlog[11]).utf8p1, 3672992343)
    TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer__RemoteFileCopy.A")
    -- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (bm.trigger_sig)("RemoteFileCopy", (this_sigattrlog[11]).utf8p1)
    return mp.INFECTED
  end
  return mp.CLEAN
end

