-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\656b37c1ba38e\1_luac 

-- params : ...
-- function num : 0
if not is_excluded_parent_proc_auto() and IsSenseRelatedProc() ~= true then
  local l_0_0 = IsProcNameInParentProcessTree
  local l_0_1 = "BM"
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC15: No list found for R2 , SetList fails

end
-- DECOMPILER ERROR at PC19: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC20: Overwrote pending register: R0 in 'AssignReg'

if l_0_0 then
  return l_0_0
end
-- DECOMPILER ERROR at PC22: Overwrote pending register: R0 in 'AssignReg'

local l_0_3 = "csrss.exe"
-- DECOMPILER ERROR at PC24: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC25: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC28: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC29: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC30: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC32: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC33: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC34: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC37: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC38: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC39: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC41: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC42: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC43: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC46: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC47: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC48: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC49: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC50: Overwrote pending register: R1 in 'AssignReg'

if (l_0_1 and not l_0_1) or l_0_1 then
  local l_0_4, l_0_5 = "aw.protectionagent.powershellexecutor64.exe", "vmware.hub.sfdagent.deploycmd.exe"
  -- DECOMPILER ERROR at PC54: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC59: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC60: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC64: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC65: Overwrote pending register: R3 in 'AssignReg'

  if l_0_3 or l_0_3 then
    return l_0_3
  end
  -- DECOMPILER ERROR at PC67: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC68: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC70: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC71: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC72: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC74: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC75: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R3 in 'AssignReg'

  local l_0_6 = "agentexecutor.exe"
  -- DECOMPILER ERROR at PC78: Overwrote pending register: R4 in 'AssignReg'

  l_0_5 = l_0_3
  l_0_4 = l_0_4(l_0_5)
  if l_0_4 then
    l_0_4 = mp
    l_0_4 = l_0_4.CLEAN
    return l_0_4
  end
  l_0_4 = l_0_3.ppid
  local l_0_7 = nil
  l_0_5 = bm
  l_0_5 = l_0_5.GetProcAddress
  l_0_6 = l_0_4
  l_0_7 = "rpcrt4.dll"
  l_0_5 = l_0_5(l_0_6, l_0_7, "NdrClientCall3")
  local l_0_8 = nil
  l_0_6 = isnull
  l_0_7 = l_0_5
  l_0_6 = l_0_6(l_0_7)
  if l_0_6 then
    l_0_6 = mp
    l_0_6 = l_0_6.CLEAN
    return l_0_6
  end
  l_0_6 = bm
  l_0_6 = l_0_6.VirtualQuery
  l_0_7 = l_0_5
  l_0_6 = l_0_6(l_0_7)
  local l_0_9, l_0_10 = nil
  do
    if l_0_6 then
      l_0_8 = isnull
      l_0_9 = 
      l_0_8 = l_0_8(l_0_9)
    end
    if l_0_8 then
      l_0_8 = mp
      l_0_8 = l_0_8.CLEAN
      return l_0_8
    end
    l_0_8 = l_0_7.base_addr
    if l_0_8 == l_0_1 then
      l_0_8 = bm
      l_0_8 = l_0_8.get_imagepath
      l_0_8 = l_0_8()
      local l_0_11 = nil
      l_0_9 = isnull
      l_0_10 = l_0_8
      l_0_9 = l_0_9(l_0_10)
      if l_0_9 then
        l_0_9 = mp
        l_0_9 = l_0_9.CLEAN
        return l_0_9
      end
      l_0_9 = checkFileLastWriteTime
      l_0_10 = l_0_8
      l_0_11 = 300
      l_0_9 = l_0_9(l_0_10, l_0_11)
      if l_0_9 then
        local l_0_12 = nil
        local l_0_13 = nil
        l_0_11, l_0_9 = l_0_9.INIT, {INIT = 1, CHECK_PATH = 2, GET_PROC_INFO = 3, GET_ROUTINE_ADDR = 4, READ_MEM = 5, DETECT_ARCH = 6, DISASSEMBLE = 7, ANALYZE = 8, FINISH = 9}
        local l_0_14 = nil
        l_0_12 = "NdrClientCall3"
        l_0_11 = {l_0_12}
        l_0_11 = function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_12
  l_1_0.process_image_path = (bm.get_imagepath)()
  if isnull(l_1_0.process_image_path) then
    return l_0_12.FINISH
  end
  return l_0_12.CHECK_PATH
end

        l_0_12 = function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_12
  l_2_0.process_image_path = (MpCommon.PathToWin32Path)(l_2_0.process_image_path)
  if isnull(l_2_0.process_image_path) then
    return l_0_12.FINISH
  end
  l_2_0.process_image_path = (string.lower)(l_2_0.process_image_path)
  if isnull(l_2_0.process_image_path) then
    return l_0_12.FINISH
  end
  return l_0_12.GET_PROC_INFO
end

        l_0_13 = function(l_3_0)
  -- function num : 0_2 , upvalues : l_0_12
  l_3_0.process_startup_info = (bm.get_current_process_startup_info)()
  if isnull(l_3_0.process_startup_info) then
    return l_0_12.FINISH
  end
  l_3_0.process_command_line = (l_3_0.process_startup_info).command_line
  l_3_0.parent_pid = (l_3_0.process_startup_info).ppid
  if isnull(l_3_0.parent_pid) or isnull(l_3_0.process_command_line) then
    return l_0_12.FINISH
  end
  return l_0_12.GET_ROUTINE_ADDR
end

        l_0_14 = function(l_4_0)
  -- function num : 0_3 , upvalues : l_0_12
  for l_4_4,l_4_5 in ipairs(l_4_0.target_routines) do
    local l_4_6 = (bm.GetProcAddress)(l_4_0.parent_pid, "rpcrt4.dll", l_4_5)
    if not isnull(l_4_6) then
      do
        do
          l_4_0.chosen_routine_name = l_4_5
          l_4_0.chosen_routine_addr = l_4_6
          do break end
          -- DECOMPILER ERROR at PC18: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC18: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC18: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  if isnull(l_4_0.chosen_routine_addr) then
    return l_0_12.FINISH
  end
  return l_0_12.READ_MEM
end

        local l_0_22 = function(l_5_0)
  -- function num : 0_4 , upvalues : l_0_12
  l_5_0.raw_bytes = (bm.ReadProcMem)(l_5_0.chosen_routine_addr, 64000, l_5_0.parent_pid)
  if isnull(l_5_0.raw_bytes) then
    return l_0_12.FINISH
  end
  return l_0_12.DETECT_ARCH
end

        local l_0_23 = function(l_6_0)
  -- function num : 0_5 , upvalues : l_0_12
  if l_6_0.chosen_routine_addr <= 4294967295 or not mp.SMS_PROC_ARCH_X64 then
    l_6_0.arch_info = mp.SMS_PROC_ARCH_X32
    return l_0_12.DISASSEMBLE
  end
end

        while 1 do
          local l_0_24 = nil
          if not ({[l_0_9.INIT] = l_0_11, [l_0_9.CHECK_PATH] = l_0_12, [l_0_9.GET_PROC_INFO] = l_0_13, [l_0_9.GET_ROUTINE_ADDR] = l_0_14, [l_0_9.READ_MEM] = l_0_22, [l_0_9.DETECT_ARCH] = l_0_23, [l_0_9.DISASSEMBLE] = function(l_7_0)
  -- function num : 0_6 , upvalues : l_0_12
  l_7_0.disassembly = (mp.x86dasm)(l_7_0.arch_info, l_7_0.chosen_routine_addr, l_7_0.raw_bytes, 64000, 100, l_7_0.chosen_routine_addr, mp.DASM_LINEAR_FLOW)
  if isnull(l_7_0.disassembly) then
    return l_0_12.FINISH
  end
  return l_0_12.ANALYZE
end
, [l_0_9.ANALYZE] = function(l_8_0)
  -- function num : 0_7 , upvalues : l_0_12
  for l_8_4,l_8_5 in pairs(l_8_0.disassembly) do
    if l_8_5.opcode == 235 or l_8_5.opcode == 195 or l_8_5.opcode == 194 then
      local l_8_6 = (string.format)("[->] Function %s at 0x%X, cpu is %d", l_8_0.chosen_routine_name, l_8_0.chosen_routine_addr, l_8_0.arch_info)
      ;
      (bm.add_related_string)("[->] MEDICATED PROCESS: ", l_8_0.process_image_path, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED COMMAND LINE: ", l_8_0.process_command_line, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED DETAILS", l_8_6, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED BYTES", l_8_5.opcode, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  return l_0_12.FINISH
end
, [l_0_9.FINISH] = function(l_9_0)
  -- function num : 0_8
  return mp.CLEAN
end
})[l_0_10.current_state] then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC204: Confused about usage of register: R21 in 'UnsetPending'

          local l_0_25 = nil
          if (({[l_0_9.INIT] = l_0_11, [l_0_9.CHECK_PATH] = l_0_12, [l_0_9.GET_PROC_INFO] = l_0_13, [l_0_9.GET_ROUTINE_ADDR] = l_0_14, [l_0_9.READ_MEM] = l_0_22, [l_0_9.DETECT_ARCH] = l_0_23, [l_0_9.DISASSEMBLE] = function(l_7_0)
  -- function num : 0_6 , upvalues : l_0_12
  l_7_0.disassembly = (mp.x86dasm)(l_7_0.arch_info, l_7_0.chosen_routine_addr, l_7_0.raw_bytes, 64000, 100, l_7_0.chosen_routine_addr, mp.DASM_LINEAR_FLOW)
  if isnull(l_7_0.disassembly) then
    return l_0_12.FINISH
  end
  return l_0_12.ANALYZE
end
, [l_0_9.ANALYZE] = function(l_8_0)
  -- function num : 0_7 , upvalues : l_0_12
  for l_8_4,l_8_5 in pairs(l_8_0.disassembly) do
    if l_8_5.opcode == 235 or l_8_5.opcode == 195 or l_8_5.opcode == 194 then
      local l_8_6 = (string.format)("[->] Function %s at 0x%X, cpu is %d", l_8_0.chosen_routine_name, l_8_0.chosen_routine_addr, l_8_0.arch_info)
      ;
      (bm.add_related_string)("[->] MEDICATED PROCESS: ", l_8_0.process_image_path, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED COMMAND LINE: ", l_8_0.process_command_line, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED DETAILS", l_8_6, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED BYTES", l_8_5.opcode, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  return l_0_12.FINISH
end
, [l_0_9.FINISH] = function(l_9_0)
  -- function num : 0_8
  return mp.CLEAN
end
})[l_0_10.current_state])(l_0_10) == mp.INFECTED then
            return mp.INFECTED
          else
            if (({[l_0_9.INIT] = l_0_11, [l_0_9.CHECK_PATH] = l_0_12, [l_0_9.GET_PROC_INFO] = l_0_13, [l_0_9.GET_ROUTINE_ADDR] = l_0_14, [l_0_9.READ_MEM] = l_0_22, [l_0_9.DETECT_ARCH] = l_0_23, [l_0_9.DISASSEMBLE] = function(l_7_0)
  -- function num : 0_6 , upvalues : l_0_12
  l_7_0.disassembly = (mp.x86dasm)(l_7_0.arch_info, l_7_0.chosen_routine_addr, l_7_0.raw_bytes, 64000, 100, l_7_0.chosen_routine_addr, mp.DASM_LINEAR_FLOW)
  if isnull(l_7_0.disassembly) then
    return l_0_12.FINISH
  end
  return l_0_12.ANALYZE
end
, [l_0_9.ANALYZE] = function(l_8_0)
  -- function num : 0_7 , upvalues : l_0_12
  for l_8_4,l_8_5 in pairs(l_8_0.disassembly) do
    if l_8_5.opcode == 235 or l_8_5.opcode == 195 or l_8_5.opcode == 194 then
      local l_8_6 = (string.format)("[->] Function %s at 0x%X, cpu is %d", l_8_0.chosen_routine_name, l_8_0.chosen_routine_addr, l_8_0.arch_info)
      ;
      (bm.add_related_string)("[->] MEDICATED PROCESS: ", l_8_0.process_image_path, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED COMMAND LINE: ", l_8_0.process_command_line, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED DETAILS", l_8_6, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED BYTES", l_8_5.opcode, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  return l_0_12.FINISH
end
, [l_0_9.FINISH] = function(l_9_0)
  -- function num : 0_8
  return mp.CLEAN
end
})[l_0_10.current_state])(l_0_10) == mp.CLEAN then
              return mp.CLEAN
            end
          end
          if type((({[l_0_9.INIT] = l_0_11, [l_0_9.CHECK_PATH] = l_0_12, [l_0_9.GET_PROC_INFO] = l_0_13, [l_0_9.GET_ROUTINE_ADDR] = l_0_14, [l_0_9.READ_MEM] = l_0_22, [l_0_9.DETECT_ARCH] = l_0_23, [l_0_9.DISASSEMBLE] = function(l_7_0)
  -- function num : 0_6 , upvalues : l_0_12
  l_7_0.disassembly = (mp.x86dasm)(l_7_0.arch_info, l_7_0.chosen_routine_addr, l_7_0.raw_bytes, 64000, 100, l_7_0.chosen_routine_addr, mp.DASM_LINEAR_FLOW)
  if isnull(l_7_0.disassembly) then
    return l_0_12.FINISH
  end
  return l_0_12.ANALYZE
end
, [l_0_9.ANALYZE] = function(l_8_0)
  -- function num : 0_7 , upvalues : l_0_12
  for l_8_4,l_8_5 in pairs(l_8_0.disassembly) do
    if l_8_5.opcode == 235 or l_8_5.opcode == 195 or l_8_5.opcode == 194 then
      local l_8_6 = (string.format)("[->] Function %s at 0x%X, cpu is %d", l_8_0.chosen_routine_name, l_8_0.chosen_routine_addr, l_8_0.arch_info)
      ;
      (bm.add_related_string)("[->] MEDICATED PROCESS: ", l_8_0.process_image_path, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED COMMAND LINE: ", l_8_0.process_command_line, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED DETAILS", l_8_6, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED BYTES", l_8_5.opcode, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  return l_0_12.FINISH
end
, [l_0_9.FINISH] = function(l_9_0)
  -- function num : 0_8
  return mp.CLEAN
end
})[l_0_10.current_state])(l_0_10)) ~= "number" then
            return mp.CLEAN
          end
          l_0_10.current_state = (({[l_0_9.INIT] = l_0_11, [l_0_9.CHECK_PATH] = l_0_12, [l_0_9.GET_PROC_INFO] = l_0_13, [l_0_9.GET_ROUTINE_ADDR] = l_0_14, [l_0_9.READ_MEM] = l_0_22, [l_0_9.DETECT_ARCH] = l_0_23, [l_0_9.DISASSEMBLE] = function(l_7_0)
  -- function num : 0_6 , upvalues : l_0_12
  l_7_0.disassembly = (mp.x86dasm)(l_7_0.arch_info, l_7_0.chosen_routine_addr, l_7_0.raw_bytes, 64000, 100, l_7_0.chosen_routine_addr, mp.DASM_LINEAR_FLOW)
  if isnull(l_7_0.disassembly) then
    return l_0_12.FINISH
  end
  return l_0_12.ANALYZE
end
, [l_0_9.ANALYZE] = function(l_8_0)
  -- function num : 0_7 , upvalues : l_0_12
  for l_8_4,l_8_5 in pairs(l_8_0.disassembly) do
    if l_8_5.opcode == 235 or l_8_5.opcode == 195 or l_8_5.opcode == 194 then
      local l_8_6 = (string.format)("[->] Function %s at 0x%X, cpu is %d", l_8_0.chosen_routine_name, l_8_0.chosen_routine_addr, l_8_0.arch_info)
      ;
      (bm.add_related_string)("[->] MEDICATED PROCESS: ", l_8_0.process_image_path, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED COMMAND LINE: ", l_8_0.process_command_line, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED DETAILS", l_8_6, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED BYTES", l_8_5.opcode, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  return l_0_12.FINISH
end
, [l_0_9.FINISH] = function(l_9_0)
  -- function num : 0_8
  return mp.CLEAN
end
})[l_0_10.current_state])(l_0_10)
        end
      end
    end
    do
      do
        do return mp.CLEAN end
        -- DECOMPILER ERROR at PC236: freeLocal<0 in 'ReleaseLocals'

      end
    end
  end
end

