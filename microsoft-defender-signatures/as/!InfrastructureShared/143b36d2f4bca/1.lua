-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\143b36d2f4bca\1.luac 

-- params : ...
-- function num : 0
do
  if not (this_sigattrlog[4]).matched or not this_sigattrlog[4] then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5 = this_sigattrlog[5]
  end
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

  if isnull(l_0_0) or isnull(l_0_0.utf8p1) or isnull(l_0_0.utf8p2) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_6, l_0_7 = , (string.match)(l_0_0.utf8p2, "injectiontype:(.-);(.*)")
  local l_0_8, l_0_9 = , (string.match)(l_0_6.utf8p1, "imagename:.+;targetprocessppid:(%d+):(%d+)$")
  if isnull(l_0_9) or isnull(R6_PC46) then
    return mp.CLEAN
  end
  local l_0_10 = nil
  -- DECOMPILER ERROR at PC58: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC59: Overwrote pending register: R6 in 'AssignReg'

  local l_0_11, l_0_12 = (string.format)(R6_PC46, l_0_9, R8_PC57), R6_PC46
  -- DECOMPILER ERROR at PC63: Overwrote pending register: R8 in 'AssignReg'

  local l_0_13 = nil
  -- DECOMPILER ERROR at PC80: Overwrote pending register: R8 in 'AssignReg'

  if not isnull(l_0_12) and not isnull(l_0_13) then
    local l_0_14 = R8_PC57
    local l_0_15 = "processinjection_wmplayer"
    local l_0_16 = safeJsonSerialize
    do
      l_0_16 = l_0_16({Target = l_0_6.utf8p1, Type = l_0_7, Info = l_0_8 or "N/A"})
      ;
      (bm.add_related_string)(l_0_15, l_0_16, bm.RelatedStringBMReport)
      if (bm.get_current_process_startup_info)() and ((bm.get_current_process_startup_info)()).ppid then
        TrackPidAndTechniqueBM(((bm.get_current_process_startup_info)()).ppid, "T1055.001", l_0_15)
      end
      ;
      (bm.add_related_process)(l_0_11)
      TrackPidAndTechniqueBM(l_0_11, "T1055.001", (string.format)("%s_target", l_0_15))
      if l_0_14 then
        (bm.add_related_process)(l_0_14)
        TrackPidAndTechniqueBM(l_0_14, "T1055.001", (string.format)("%s_source", l_0_15))
      end
      do return mp.INFECTED end
      -- DECOMPILER ERROR at PC143: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

