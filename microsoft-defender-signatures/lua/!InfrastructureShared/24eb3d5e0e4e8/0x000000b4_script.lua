-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\24eb3d5e0e4e8\0x000000b4_luac 

-- params : ...
-- function num : 0
if not is_excluded_parent_proc_auto() and IsSenseRelatedProc() ~= true then
  local l_0_0 = IsProcNameInParentProcessTree
  local l_0_1 = "BM"
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC13: No list found for R2 , SetList fails

end
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC18: Overwrote pending register: R0 in 'AssignReg'

if l_0_0 then
  return l_0_0
end
-- DECOMPILER ERROR at PC20: Overwrote pending register: R0 in 'AssignReg'

local l_0_3, l_0_4 = "acrodist.exe", "csrss.exe"
l_0_2 = this_sigattrlog
l_0_2 = l_0_2[3]
l_0_2 = l_0_2.matched
if l_0_2 then
  l_0_2 = this_sigattrlog
  l_0_2 = l_0_2[3]
  -- DECOMPILER ERROR at PC28: Overwrote pending register: R0 in 'AssignReg'

end
l_0_2 = string
l_0_2 = l_0_2.match
l_0_3 = l_0_0
l_0_4 = "^([0-9]+);regionsize:([0-9]+)"
l_0_2 = l_0_2(l_0_3, l_0_4)
local l_0_5, l_0_6 = nil
l_0_4 = isnull
l_0_5 = l_0_2
l_0_4 = l_0_4(l_0_5)
if not l_0_4 then
  l_0_4 = isnull
  l_0_5 = 
  l_0_4 = l_0_4(l_0_5)
end
if l_0_4 then
  l_0_4 = mp
  l_0_4 = l_0_4.CLEAN
  return l_0_4
end
l_0_4 = tonumber
l_0_5 = l_0_2
l_0_4 = l_0_4(l_0_5)
l_0_2 = l_0_4
l_0_4 = tonumber
l_0_5 = 
l_0_4 = l_0_4(l_0_5)
l_0_3 = l_0_4
l_0_4 = bm
l_0_4 = l_0_4.get_current_process_startup_info
l_0_4 = l_0_4()
local l_0_7 = nil
l_0_5 = isnull
l_0_6 = l_0_4
l_0_5 = l_0_5(l_0_6)
if l_0_5 then
  l_0_5 = mp
  l_0_5 = l_0_5.CLEAN
  return l_0_5
end
l_0_5 = l_0_4.ppid
local l_0_8 = nil
do
  local l_0_9 = nil
  l_0_7 = "AmsiOpenSession"
  l_0_8 = "AmsiScanBuffer"
  l_0_9 = "AmsiInitialize"
  l_0_7 = ipairs
  l_0_8, l_0_6 = l_0_6, {l_0_7, l_0_8, l_0_9, "AmsiScanString"}
  l_0_7 = l_0_7(l_0_8)
  for l_0_13,l_0_14 in l_0_7 do
    local l_0_12, l_0_13, l_0_14 = nil
    l_0_12 = bm
    l_0_12 = l_0_12.GetProcAddress
    l_0_13 = l_0_5
    l_0_14 = "amsi.dll"
    l_0_12 = l_0_12(l_0_13, l_0_14, l_0_11)
    local l_0_15 = nil
    l_0_13 = isnull
    l_0_14 = l_0_12
    l_0_13 = l_0_13(l_0_14)
    if l_0_13 then
      l_0_13 = mp
      l_0_13 = l_0_13.CLEAN
      return l_0_13
    end
    l_0_13 = isnull
    l_0_14 = l_0_12
    l_0_13 = l_0_13(l_0_14)
    if l_0_13 then
      l_0_13 = mp
      l_0_13 = l_0_13.CLEAN
      return l_0_13
    end
    l_0_13 = bm
    l_0_13 = l_0_13.VirtualQuery
    l_0_14 = l_0_12
    l_0_13 = l_0_13(l_0_14)
    local l_0_16, l_0_17 = nil
    do
      if l_0_13 then
        l_0_15 = isnull
        l_0_16 = 
        l_0_15 = l_0_15(l_0_16)
      end
      if l_0_15 then
        l_0_15 = mp
        l_0_15 = l_0_15.CLEAN
        return l_0_15
      end
      l_0_15 = l_0_14.base_addr
      if l_0_15 == l_0_2 then
        l_0_15 = bm
        l_0_15 = l_0_15.get_imagepath
        l_0_15 = l_0_15()
        local l_0_18 = nil
        l_0_16 = isnull
        l_0_17 = l_0_15
        l_0_16 = l_0_16(l_0_17)
        if l_0_16 then
          l_0_16 = mp
          l_0_16 = l_0_16.CLEAN
          return l_0_16
        end
        l_0_16 = checkFileLastWriteTime
        l_0_17 = l_0_15
        l_0_18 = 300
        l_0_16 = l_0_16(l_0_17, l_0_18)
        if l_0_16 then
          local l_0_19 = nil
          local l_0_20 = nil
          l_0_18, l_0_16 = l_0_16.INIT, {INIT = 1, CHECK_PATH = 2, GET_PROC_INFO = 3, GET_ROUTINE_ADDR = 4, READ_MEM = 5, DETECT_ARCH = 6, DISASSEMBLE = 7, ANALYZE = 8, FINISH = 9}
          l_0_18 = function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_19
  if isnull(l_1_0) then
    return mp.CLEAN
  end
  if isnull(l_1_0.patched_process_image_path) then
    return l_0_19.FINISH
  end
  return l_0_19.CHECK_PATH
end

          l_0_19 = function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_19
  if isnull(l_2_0) then
    return mp.CLEAN
  end
  l_2_0.patched_process_image_path = (MpCommon.PathToWin32Path)(l_2_0.patched_process_image_path)
  if isnull(l_2_0.patched_process_image_path) then
    return l_0_19.FINISH
  end
  l_2_0.patched_process_image_path = (string.lower)(l_2_0.patched_process_image_path)
  if isnull(l_2_0.patched_process_image_path) then
    return l_0_19.FINISH
  end
  return l_0_19.GET_PROC_INFO
end

          l_0_20 = function(l_3_0)
  -- function num : 0_2 , upvalues : l_0_19
  if isnull(l_3_0) then
    return mp.CLEAN
  end
  if isnull(l_3_0.patched_process_stats) then
    return l_0_19.FINISH
  end
  local l_3_1 = (l_3_0.patched_process_stats).command_line
  if isnull(l_3_0.patched_process_ppid) or isnull(l_3_1) then
    return l_0_19.FINISH
  end
  l_3_0.patched_process_command_line = l_3_1
  return l_0_19.GET_ROUTINE_ADDR
end

          local l_0_29 = function(l_4_0)
  -- function num : 0_3 , upvalues : l_0_19
  if isnull(l_4_0) then
    return mp.CLEAN
  end
  if isnull(l_4_0.patched_amsi_routine_addr) then
    return l_0_19.FINISH
  end
  return l_0_19.READ_MEM
end

          local l_0_30 = function(l_5_0)
  -- function num : 0_4 , upvalues : l_0_19, l_0_4
  if isnull(l_5_0) then
    return mp.CLEAN
  end
  local l_5_1 = (bm.ReadProcMem)(l_5_0.patched_amsi_routine_addr, 256, l_5_0.patched_process_ppid)
  if isnull(l_5_1) then
    return l_0_19.FINISH
  end
  l_0_4 = tohex(tostring(l_5_1))
  l_5_0.raw_bytes = l_5_1
  return l_0_19.DETECT_ARCH
end

          while 1 do
            local l_0_31 = nil
            if not ({[l_0_16.INIT] = l_0_18, [l_0_16.CHECK_PATH] = l_0_19, [l_0_16.GET_PROC_INFO] = l_0_20, [l_0_16.GET_ROUTINE_ADDR] = l_0_29, [l_0_16.READ_MEM] = l_0_30, [l_0_16.DETECT_ARCH] = function(l_6_0)
  -- function num : 0_5 , upvalues : l_0_19
  if isnull(l_6_0) then
    return mp.CLEAN
  end
  if l_6_0.patched_amsi_routine_addr > 4294967295 then
    l_6_0.arch_information = mp.SMS_PROC_ARCH_X64
  else
    l_6_0.arch_information = mp.SMS_PROC_ARCH_X32
  end
  return l_0_19.DISASSEMBLE
end
, [l_0_16.DISASSEMBLE] = function(l_7_0)
  -- function num : 0_6 , upvalues : l_0_19
  if isnull(l_7_0) then
    return mp.CLEAN
  end
  local l_7_1 = (mp.x86dasm)(l_7_0.arch_information, l_7_0.patched_amsi_routine_addr, l_7_0.raw_bytes, 256, 50, l_7_0.patched_amsi_routine_addr, mp.DASM_LINEAR_FLOW)
  if isnull(l_7_1) then
    return l_0_19.FINISH
  end
  l_7_0.disassembled_instructions = l_7_1
  return l_0_19.ANALYZE
end
, [l_0_16.ANALYZE] = function(l_8_0)
  -- function num : 0_7 , upvalues : l_0_4, l_0_19
  if isnull(l_8_0) then
    return mp.CLEAN
  end
  for l_8_4,l_8_5 in pairs(l_8_0.disassembled_instructions) do
    if l_8_5.opcode == 235 or l_8_5.opcode == 195 or l_8_5.opcode == 194 then
      local l_8_6 = (string.format)("[->] Function %s at 0x%02x, cpu is %d", l_8_0.chosen_amsi_routine_name, l_8_0.patched_amsi_routine_addr, l_8_0.arch_information)
      ;
      (bm.add_related_string)("[->] MEDICATED PROCESS: ", l_8_0.patched_process_image_path, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED COMMAND LINE: ", l_8_0.patched_process_command_line, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED DETAILS", l_8_6, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED BYTES", l_0_4, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  return l_0_19.FINISH
end
, [l_0_16.FINISH] = function(l_9_0)
  -- function num : 0_8
  return mp.CLEAN
end
})[l_0_17.current_state] then
              return mp.CLEAN
            end
            -- DECOMPILER ERROR at PC199: Confused about usage of register: R28 in 'UnsetPending'

            local l_0_32 = nil
            if (({[l_0_16.INIT] = l_0_18, [l_0_16.CHECK_PATH] = l_0_19, [l_0_16.GET_PROC_INFO] = l_0_20, [l_0_16.GET_ROUTINE_ADDR] = l_0_29, [l_0_16.READ_MEM] = l_0_30, [l_0_16.DETECT_ARCH] = function(l_6_0)
  -- function num : 0_5 , upvalues : l_0_19
  if isnull(l_6_0) then
    return mp.CLEAN
  end
  if l_6_0.patched_amsi_routine_addr > 4294967295 then
    l_6_0.arch_information = mp.SMS_PROC_ARCH_X64
  else
    l_6_0.arch_information = mp.SMS_PROC_ARCH_X32
  end
  return l_0_19.DISASSEMBLE
end
, [l_0_16.DISASSEMBLE] = function(l_7_0)
  -- function num : 0_6 , upvalues : l_0_19
  if isnull(l_7_0) then
    return mp.CLEAN
  end
  local l_7_1 = (mp.x86dasm)(l_7_0.arch_information, l_7_0.patched_amsi_routine_addr, l_7_0.raw_bytes, 256, 50, l_7_0.patched_amsi_routine_addr, mp.DASM_LINEAR_FLOW)
  if isnull(l_7_1) then
    return l_0_19.FINISH
  end
  l_7_0.disassembled_instructions = l_7_1
  return l_0_19.ANALYZE
end
, [l_0_16.ANALYZE] = function(l_8_0)
  -- function num : 0_7 , upvalues : l_0_4, l_0_19
  if isnull(l_8_0) then
    return mp.CLEAN
  end
  for l_8_4,l_8_5 in pairs(l_8_0.disassembled_instructions) do
    if l_8_5.opcode == 235 or l_8_5.opcode == 195 or l_8_5.opcode == 194 then
      local l_8_6 = (string.format)("[->] Function %s at 0x%02x, cpu is %d", l_8_0.chosen_amsi_routine_name, l_8_0.patched_amsi_routine_addr, l_8_0.arch_information)
      ;
      (bm.add_related_string)("[->] MEDICATED PROCESS: ", l_8_0.patched_process_image_path, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED COMMAND LINE: ", l_8_0.patched_process_command_line, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED DETAILS", l_8_6, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED BYTES", l_0_4, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  return l_0_19.FINISH
end
, [l_0_16.FINISH] = function(l_9_0)
  -- function num : 0_8
  return mp.CLEAN
end
})[l_0_17.current_state])(l_0_17) == mp.INFECTED then
              return mp.INFECTED
            else
              if (({[l_0_16.INIT] = l_0_18, [l_0_16.CHECK_PATH] = l_0_19, [l_0_16.GET_PROC_INFO] = l_0_20, [l_0_16.GET_ROUTINE_ADDR] = l_0_29, [l_0_16.READ_MEM] = l_0_30, [l_0_16.DETECT_ARCH] = function(l_6_0)
  -- function num : 0_5 , upvalues : l_0_19
  if isnull(l_6_0) then
    return mp.CLEAN
  end
  if l_6_0.patched_amsi_routine_addr > 4294967295 then
    l_6_0.arch_information = mp.SMS_PROC_ARCH_X64
  else
    l_6_0.arch_information = mp.SMS_PROC_ARCH_X32
  end
  return l_0_19.DISASSEMBLE
end
, [l_0_16.DISASSEMBLE] = function(l_7_0)
  -- function num : 0_6 , upvalues : l_0_19
  if isnull(l_7_0) then
    return mp.CLEAN
  end
  local l_7_1 = (mp.x86dasm)(l_7_0.arch_information, l_7_0.patched_amsi_routine_addr, l_7_0.raw_bytes, 256, 50, l_7_0.patched_amsi_routine_addr, mp.DASM_LINEAR_FLOW)
  if isnull(l_7_1) then
    return l_0_19.FINISH
  end
  l_7_0.disassembled_instructions = l_7_1
  return l_0_19.ANALYZE
end
, [l_0_16.ANALYZE] = function(l_8_0)
  -- function num : 0_7 , upvalues : l_0_4, l_0_19
  if isnull(l_8_0) then
    return mp.CLEAN
  end
  for l_8_4,l_8_5 in pairs(l_8_0.disassembled_instructions) do
    if l_8_5.opcode == 235 or l_8_5.opcode == 195 or l_8_5.opcode == 194 then
      local l_8_6 = (string.format)("[->] Function %s at 0x%02x, cpu is %d", l_8_0.chosen_amsi_routine_name, l_8_0.patched_amsi_routine_addr, l_8_0.arch_information)
      ;
      (bm.add_related_string)("[->] MEDICATED PROCESS: ", l_8_0.patched_process_image_path, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED COMMAND LINE: ", l_8_0.patched_process_command_line, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED DETAILS", l_8_6, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED BYTES", l_0_4, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  return l_0_19.FINISH
end
, [l_0_16.FINISH] = function(l_9_0)
  -- function num : 0_8
  return mp.CLEAN
end
})[l_0_17.current_state])(l_0_17) == mp.CLEAN then
                break
              else
                if type((({[l_0_16.INIT] = l_0_18, [l_0_16.CHECK_PATH] = l_0_19, [l_0_16.GET_PROC_INFO] = l_0_20, [l_0_16.GET_ROUTINE_ADDR] = l_0_29, [l_0_16.READ_MEM] = l_0_30, [l_0_16.DETECT_ARCH] = function(l_6_0)
  -- function num : 0_5 , upvalues : l_0_19
  if isnull(l_6_0) then
    return mp.CLEAN
  end
  if l_6_0.patched_amsi_routine_addr > 4294967295 then
    l_6_0.arch_information = mp.SMS_PROC_ARCH_X64
  else
    l_6_0.arch_information = mp.SMS_PROC_ARCH_X32
  end
  return l_0_19.DISASSEMBLE
end
, [l_0_16.DISASSEMBLE] = function(l_7_0)
  -- function num : 0_6 , upvalues : l_0_19
  if isnull(l_7_0) then
    return mp.CLEAN
  end
  local l_7_1 = (mp.x86dasm)(l_7_0.arch_information, l_7_0.patched_amsi_routine_addr, l_7_0.raw_bytes, 256, 50, l_7_0.patched_amsi_routine_addr, mp.DASM_LINEAR_FLOW)
  if isnull(l_7_1) then
    return l_0_19.FINISH
  end
  l_7_0.disassembled_instructions = l_7_1
  return l_0_19.ANALYZE
end
, [l_0_16.ANALYZE] = function(l_8_0)
  -- function num : 0_7 , upvalues : l_0_4, l_0_19
  if isnull(l_8_0) then
    return mp.CLEAN
  end
  for l_8_4,l_8_5 in pairs(l_8_0.disassembled_instructions) do
    if l_8_5.opcode == 235 or l_8_5.opcode == 195 or l_8_5.opcode == 194 then
      local l_8_6 = (string.format)("[->] Function %s at 0x%02x, cpu is %d", l_8_0.chosen_amsi_routine_name, l_8_0.patched_amsi_routine_addr, l_8_0.arch_information)
      ;
      (bm.add_related_string)("[->] MEDICATED PROCESS: ", l_8_0.patched_process_image_path, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED COMMAND LINE: ", l_8_0.patched_process_command_line, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED DETAILS", l_8_6, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED BYTES", l_0_4, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  return l_0_19.FINISH
end
, [l_0_16.FINISH] = function(l_9_0)
  -- function num : 0_8
  return mp.CLEAN
end
})[l_0_17.current_state])(l_0_17)) ~= "number" then
                  return mp.CLEAN
                end
              end
            end
            l_0_17.current_state = (({[l_0_16.INIT] = l_0_18, [l_0_16.CHECK_PATH] = l_0_19, [l_0_16.GET_PROC_INFO] = l_0_20, [l_0_16.GET_ROUTINE_ADDR] = l_0_29, [l_0_16.READ_MEM] = l_0_30, [l_0_16.DETECT_ARCH] = function(l_6_0)
  -- function num : 0_5 , upvalues : l_0_19
  if isnull(l_6_0) then
    return mp.CLEAN
  end
  if l_6_0.patched_amsi_routine_addr > 4294967295 then
    l_6_0.arch_information = mp.SMS_PROC_ARCH_X64
  else
    l_6_0.arch_information = mp.SMS_PROC_ARCH_X32
  end
  return l_0_19.DISASSEMBLE
end
, [l_0_16.DISASSEMBLE] = function(l_7_0)
  -- function num : 0_6 , upvalues : l_0_19
  if isnull(l_7_0) then
    return mp.CLEAN
  end
  local l_7_1 = (mp.x86dasm)(l_7_0.arch_information, l_7_0.patched_amsi_routine_addr, l_7_0.raw_bytes, 256, 50, l_7_0.patched_amsi_routine_addr, mp.DASM_LINEAR_FLOW)
  if isnull(l_7_1) then
    return l_0_19.FINISH
  end
  l_7_0.disassembled_instructions = l_7_1
  return l_0_19.ANALYZE
end
, [l_0_16.ANALYZE] = function(l_8_0)
  -- function num : 0_7 , upvalues : l_0_4, l_0_19
  if isnull(l_8_0) then
    return mp.CLEAN
  end
  for l_8_4,l_8_5 in pairs(l_8_0.disassembled_instructions) do
    if l_8_5.opcode == 235 or l_8_5.opcode == 195 or l_8_5.opcode == 194 then
      local l_8_6 = (string.format)("[->] Function %s at 0x%02x, cpu is %d", l_8_0.chosen_amsi_routine_name, l_8_0.patched_amsi_routine_addr, l_8_0.arch_information)
      ;
      (bm.add_related_string)("[->] MEDICATED PROCESS: ", l_8_0.patched_process_image_path, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED COMMAND LINE: ", l_8_0.patched_process_command_line, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED DETAILS", l_8_6, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("[->] MEDICATED BYTES", l_0_4, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  return l_0_19.FINISH
end
, [l_0_16.FINISH] = function(l_9_0)
  -- function num : 0_8
  return mp.CLEAN
end
})[l_0_17.current_state])(l_0_17)
            if l_0_17.current_state == l_0_16.FINISH then
              break
            end
          end
          do
            do return mp.CLEAN end
            -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC240: freeLocal<0 in 'ReleaseLocals'

end

