local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = is_excluded_parent_proc_auto
L0_1 = L0_1()
if not L0_1 then
  L0_1 = IsSenseRelatedProc
  L0_1 = L0_1()
  if L0_1 ~= true then
    L0_1 = IsProcNameInParentProcessTree
    L1_1 = "BM"
    L2_1 = {}
    L3_1 = "csrss.exe"
    L4_1 = "aw.protectionagent.powershellexecutor64.exe"
    L5_1 = "vmware.hub.sfdagent.deploycmd.exe"
    L6_1 = "agentexecutor.exe"
    L2_1[1] = L3_1
    L2_1[2] = L4_1
    L2_1[3] = L5_1
    L2_1[4] = L6_1
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      goto lbl_23
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_23::
L0_1 = nil
L1_1 = this_sigattrlog
L1_1 = L1_1[9]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[9]
  L0_1 = L1_1.utf8p2
end
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "vmbaseaddress:([0-9]+);vmregionsize:([0-9]+)"
L1_1, L2_1 = L1_1(L2_1, L3_1)
L3_1 = isnull
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_50
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_50::
L3_1 = tonumber
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L1_1 = L3_1
L3_1 = tonumber
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = bm
L3_1 = L3_1.get_current_process_startup_info
L3_1 = L3_1()
L4_1 = isnull
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L3_1.ppid
L5_1 = bm
L5_1 = L5_1.GetProcAddress
L6_1 = L4_1
L7_1 = "rpcrt4.dll"
L8_1 = "NdrClientCall3"
L5_1 = L5_1(L6_1, L7_1, L8_1)
L6_1 = isnull
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = bm
L6_1 = L6_1.VirtualQuery
L7_1 = L5_1
L6_1, L7_1 = L6_1(L7_1)
if L6_1 then
  L8_1 = isnull
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  if not L8_1 then
    goto lbl_98
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_98::
L8_1 = L7_1.base_addr
if L8_1 == L1_1 then
  L8_1 = bm
  L8_1 = L8_1.get_imagepath
  L8_1 = L8_1()
  L9_1 = isnull
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  if L9_1 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = checkFileLastWriteTime
  L10_1 = L8_1
  L11_1 = 300
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 then
    L9_1 = {}
    L9_1.INIT = 1
    L9_1.CHECK_PATH = 2
    L9_1.GET_PROC_INFO = 3
    L9_1.GET_ROUTINE_ADDR = 4
    L9_1.READ_MEM = 5
    L9_1.DETECT_ARCH = 6
    L9_1.DISASSEMBLE = 7
    L9_1.ANALYZE = 8
    L9_1.FINISH = 9
    L10_1 = {}
    L11_1 = L9_1.INIT
    L10_1.current_state = L11_1
    L10_1.process_image_path = nil
    L10_1.process_startup_info = nil
    L10_1.process_command_line = nil
    L10_1.parent_pid = nil
    L11_1 = {}
    L12_1 = "NdrClientCall3"
    L11_1[1] = L12_1
    L10_1.target_routines = L11_1
    L10_1.chosen_routine_name = nil
    L10_1.chosen_routine_addr = nil
    L10_1.raw_bytes = nil
    L10_1.arch_info = nil
    L10_1.disassembly = nil
    
    function L11_1(A0_2)
      local L1_2, L2_2
      L1_2 = bm
      L1_2 = L1_2.get_imagepath
      L1_2 = L1_2()
      A0_2.process_image_path = L1_2
      L1_2 = isnull
      L2_2 = A0_2.process_image_path
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L1_2 = L9_1
        L1_2 = L1_2.FINISH
        return L1_2
      end
      L1_2 = L9_1
      L1_2 = L1_2.CHECK_PATH
      return L1_2
    end
    
    function L12_1(A0_2)
      local L1_2, L2_2
      L1_2 = MpCommon
      L1_2 = L1_2.PathToWin32Path
      L2_2 = A0_2.process_image_path
      L1_2 = L1_2(L2_2)
      A0_2.process_image_path = L1_2
      L1_2 = isnull
      L2_2 = A0_2.process_image_path
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L1_2 = L9_1
        L1_2 = L1_2.FINISH
        return L1_2
      end
      L1_2 = string
      L1_2 = L1_2.lower
      L2_2 = A0_2.process_image_path
      L1_2 = L1_2(L2_2)
      A0_2.process_image_path = L1_2
      L1_2 = isnull
      L2_2 = A0_2.process_image_path
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L1_2 = L9_1
        L1_2 = L1_2.FINISH
        return L1_2
      end
      L1_2 = L9_1
      L1_2 = L1_2.GET_PROC_INFO
      return L1_2
    end
    
    function L13_1(A0_2)
      local L1_2, L2_2
      L1_2 = bm
      L1_2 = L1_2.get_current_process_startup_info
      L1_2 = L1_2()
      A0_2.process_startup_info = L1_2
      L1_2 = isnull
      L2_2 = A0_2.process_startup_info
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L1_2 = L9_1
        L1_2 = L1_2.FINISH
        return L1_2
      end
      L1_2 = A0_2.process_startup_info
      L1_2 = L1_2.command_line
      A0_2.process_command_line = L1_2
      L1_2 = A0_2.process_startup_info
      L1_2 = L1_2.ppid
      A0_2.parent_pid = L1_2
      L1_2 = isnull
      L2_2 = A0_2.parent_pid
      L1_2 = L1_2(L2_2)
      if not L1_2 then
        L1_2 = isnull
        L2_2 = A0_2.process_command_line
        L1_2 = L1_2(L2_2)
        if not L1_2 then
          goto lbl_32
        end
      end
      L1_2 = L9_1
      L1_2 = L1_2.FINISH
      do return L1_2 end
      ::lbl_32::
      L1_2 = L9_1
      L1_2 = L1_2.GET_ROUTINE_ADDR
      return L1_2
    end
    
    function L14_1(A0_2)
      local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
      L1_2 = ipairs
      L2_2 = A0_2.target_routines
      L1_2, L2_2, L3_2 = L1_2(L2_2)
      for L4_2, L5_2 in L1_2, L2_2, L3_2 do
        L6_2 = bm
        L6_2 = L6_2.GetProcAddress
        L7_2 = A0_2.parent_pid
        L8_2 = "rpcrt4.dll"
        L9_2 = L5_2
        L6_2 = L6_2(L7_2, L8_2, L9_2)
        L7_2 = isnull
        L8_2 = L6_2
        L7_2 = L7_2(L8_2)
        if not L7_2 then
          A0_2.chosen_routine_name = L5_2
          A0_2.chosen_routine_addr = L6_2
          break
        end
      end
      L1_2 = isnull
      L2_2 = A0_2.chosen_routine_addr
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L1_2 = L9_1
        L1_2 = L1_2.FINISH
        return L1_2
      end
      L1_2 = L9_1
      L1_2 = L1_2.READ_MEM
      return L1_2
    end
    
    function L15_1(A0_2)
      local L1_2, L2_2, L3_2, L4_2
      L1_2 = bm
      L1_2 = L1_2.ReadProcMem
      L2_2 = A0_2.chosen_routine_addr
      L3_2 = 64000
      L4_2 = A0_2.parent_pid
      L1_2 = L1_2(L2_2, L3_2, L4_2)
      A0_2.raw_bytes = L1_2
      L1_2 = isnull
      L2_2 = A0_2.raw_bytes
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L1_2 = L9_1
        L1_2 = L1_2.FINISH
        return L1_2
      end
      L1_2 = L9_1
      L1_2 = L1_2.DETECT_ARCH
      return L1_2
    end
    
    function L16_1(A0_2)
      local L1_2
      L1_2 = A0_2.chosen_routine_addr
      if 4294967295 < L1_2 then
        L1_2 = mp
        L1_2 = L1_2.SMS_PROC_ARCH_X64
        if L1_2 then
          goto lbl_10
        end
      end
      L1_2 = mp
      L1_2 = L1_2.SMS_PROC_ARCH_X32
      ::lbl_10::
      A0_2.arch_info = L1_2
      L1_2 = L9_1
      L1_2 = L1_2.DISASSEMBLE
      return L1_2
    end
    
    function L17_1(A0_2)
      local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
      L1_2 = mp
      L1_2 = L1_2.x86dasm
      L2_2 = A0_2.arch_info
      L3_2 = A0_2.chosen_routine_addr
      L4_2 = A0_2.raw_bytes
      L5_2 = 64000
      L6_2 = 100
      L7_2 = A0_2.chosen_routine_addr
      L8_2 = mp
      L8_2 = L8_2.DASM_LINEAR_FLOW
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
      A0_2.disassembly = L1_2
      L1_2 = isnull
      L2_2 = A0_2.disassembly
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L1_2 = L9_1
        L1_2 = L1_2.FINISH
        return L1_2
      end
      L1_2 = L9_1
      L1_2 = L1_2.ANALYZE
      return L1_2
    end
    
    function L18_1(A0_2)
      local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
      L1_2 = pairs
      L2_2 = A0_2.disassembly
      L1_2, L2_2, L3_2 = L1_2(L2_2)
      for L4_2, L5_2 in L1_2, L2_2, L3_2 do
        L6_2 = L5_2.opcode
        if L6_2 ~= 235 then
          L6_2 = L5_2.opcode
          if L6_2 ~= 195 then
            L6_2 = L5_2.opcode
            if L6_2 ~= 194 then
              goto lbl_52
            end
          end
        end
        L6_2 = string
        L6_2 = L6_2.format
        L7_2 = "[->] Function %s at 0x%X, cpu is %d"
        L8_2 = A0_2.chosen_routine_name
        L9_2 = A0_2.chosen_routine_addr
        L10_2 = A0_2.arch_info
        L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
        L7_2 = bm
        L7_2 = L7_2.add_related_string
        L8_2 = "[->] MEDICATED PROCESS: "
        L9_2 = A0_2.process_image_path
        L10_2 = bm
        L10_2 = L10_2.RelatedStringBMReport
        L7_2(L8_2, L9_2, L10_2)
        L7_2 = bm
        L7_2 = L7_2.add_related_string
        L8_2 = "[->] MEDICATED COMMAND LINE: "
        L9_2 = A0_2.process_command_line
        L10_2 = bm
        L10_2 = L10_2.RelatedStringBMReport
        L7_2(L8_2, L9_2, L10_2)
        L7_2 = bm
        L7_2 = L7_2.add_related_string
        L8_2 = "[->] MEDICATED DETAILS"
        L9_2 = L6_2
        L10_2 = bm
        L10_2 = L10_2.RelatedStringBMReport
        L7_2(L8_2, L9_2, L10_2)
        L7_2 = bm
        L7_2 = L7_2.add_related_string
        L8_2 = "[->] MEDICATED BYTES"
        L9_2 = L5_2.opcode
        L10_2 = bm
        L10_2 = L10_2.RelatedStringBMReport
        L7_2(L8_2, L9_2, L10_2)
        L7_2 = mp
        L7_2 = L7_2.INFECTED
        do return L7_2 end
        ::lbl_52::
      end
      L1_2 = L9_1
      L1_2 = L1_2.FINISH
      return L1_2
    end
    
    function L19_1(A0_2)
      local L1_2
      L1_2 = mp
      L1_2 = L1_2.CLEAN
      return L1_2
    end
    
    L20_1 = {}
    L21_1 = L9_1.INIT
    L20_1[L21_1] = L11_1
    L21_1 = L9_1.CHECK_PATH
    L20_1[L21_1] = L12_1
    L21_1 = L9_1.GET_PROC_INFO
    L20_1[L21_1] = L13_1
    L21_1 = L9_1.GET_ROUTINE_ADDR
    L20_1[L21_1] = L14_1
    L21_1 = L9_1.READ_MEM
    L20_1[L21_1] = L15_1
    L21_1 = L9_1.DETECT_ARCH
    L20_1[L21_1] = L16_1
    L21_1 = L9_1.DISASSEMBLE
    L20_1[L21_1] = L17_1
    L21_1 = L9_1.ANALYZE
    L20_1[L21_1] = L18_1
    L21_1 = L9_1.FINISH
    L20_1[L21_1] = L19_1
    while true do
      L21_1 = L10_1.current_state
      L21_1 = L20_1[L21_1]
      if not L21_1 then
        L22_1 = mp
        L22_1 = L22_1.CLEAN
        return L22_1
      end
      L22_1 = L21_1
      L23_1 = L10_1
      L22_1 = L22_1(L23_1)
      L23_1 = mp
      L23_1 = L23_1.INFECTED
      if L22_1 == L23_1 then
        L23_1 = mp
        L23_1 = L23_1.INFECTED
        return L23_1
      else
        L23_1 = mp
        L23_1 = L23_1.CLEAN
        if L22_1 == L23_1 then
          L23_1 = mp
          L23_1 = L23_1.CLEAN
          return L23_1
        end
      end
      L23_1 = type
      L24_1 = L22_1
      L23_1 = L23_1(L24_1)
      if L23_1 ~= "number" then
        L23_1 = mp
        L23_1 = L23_1.CLEAN
        return L23_1
      end
      L10_1.current_state = L22_1
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
