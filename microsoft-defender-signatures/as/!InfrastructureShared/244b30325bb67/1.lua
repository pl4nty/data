local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1
L0_1 = is_excluded_parent_proc_auto
L0_1 = L0_1()
if not L0_1 then
  L0_1 = IsSenseRelatedProc
  L0_1 = L0_1()
  if L0_1 ~= true then
    L0_1 = IsProcNameInParentProcessTree
    L1_1 = "BM"
    L2_1 = {}
    L3_1 = "acrodist.exe"
    L4_1 = "csrss.exe"
    L2_1[1] = L3_1
    L2_1[2] = L4_1
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      goto lbl_21
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_21::
L0_1 = nil
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L0_1 = L2_1.utf8p2
end
L3_1 = L0_1
L2_1 = L0_1.match
L4_1 = "(%d+);regionsize:(%d+)"
L2_1, L3_1 = L2_1(L3_1, L4_1)
L4_1 = isnull
L5_1 = L2_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = isnull
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    goto lbl_46
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_46::
L4_1 = tonumber
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L2_1 = L4_1
L4_1 = tonumber
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = bm
L4_1 = L4_1.get_current_process_startup_info
L4_1 = L4_1()
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L4_1.ppid
L6_1 = {}
L7_1 = "AmsiOpenSession"
L8_1 = "AmsiScanBuffer"
L9_1 = "AmsiInitialize"
L10_1 = "AmsiScanString"
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L6_1[4] = L10_1
L7_1 = ipairs
L8_1 = L6_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  L12_1 = bm
  L12_1 = L12_1.GetProcAddress
  L13_1 = L5_1
  L14_1 = "amsi.dll"
  L15_1 = L11_1
  L12_1 = L12_1(L13_1, L14_1, L15_1)
  L13_1 = isnull
  L14_1 = L12_1
  L13_1 = L13_1(L14_1)
  if L13_1 then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L13_1 = isnull
  L14_1 = L12_1
  L13_1 = L13_1(L14_1)
  if L13_1 then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L13_1 = bm
  L13_1 = L13_1.VirtualQuery
  L14_1 = L12_1
  L13_1, L14_1 = L13_1(L14_1)
  if L13_1 then
    L15_1 = isnull
    L16_1 = L14_1
    L15_1 = L15_1(L16_1)
    if not L15_1 then
      goto lbl_112
    end
  end
  L15_1 = mp
  L15_1 = L15_1.CLEAN
  do return L15_1 end
  ::lbl_112::
  L15_1 = L14_1.base_addr
  if L15_1 == L2_1 then
    L15_1 = bm
    L15_1 = L15_1.get_imagepath
    L15_1 = L15_1()
    L16_1 = isnull
    L17_1 = L15_1
    L16_1 = L16_1(L17_1)
    if L16_1 then
      L16_1 = mp
      L16_1 = L16_1.CLEAN
      return L16_1
    end
    L16_1 = checkFileLastWriteTime
    L17_1 = L15_1
    L18_1 = 300
    L16_1 = L16_1(L17_1, L18_1)
    if L16_1 then
      L16_1 = {}
      L16_1.INIT = 1
      L16_1.CHECK_PATH = 2
      L16_1.GET_PROC_INFO = 3
      L16_1.GET_ROUTINE_ADDR = 4
      L16_1.READ_MEM = 5
      L16_1.DETECT_ARCH = 6
      L16_1.DISASSEMBLE = 7
      L16_1.ANALYZE = 8
      L16_1.FINISH = 9
      L17_1 = {}
      L18_1 = L16_1.INIT
      L17_1.current_state = L18_1
      L17_1.patched_process_image_path = L15_1
      L17_1.patched_process_stats = L4_1
      L17_1.patched_process_ppid = L5_1
      L17_1.chosen_amsi_routine_name = L11_1
      L17_1.patched_amsi_routine_addr = L12_1
      L17_1.raw_bytes = nil
      L17_1.arch_information = nil
      L17_1.disassembled_instructions = nil
      
      function L18_1(A0_2)
        local L1_2, L2_2
        L1_2 = isnull
        L2_2 = A0_2
        L1_2 = L1_2(L2_2)
        if L1_2 then
          L1_2 = mp
          L1_2 = L1_2.CLEAN
          return L1_2
        end
        L1_2 = isnull
        L2_2 = A0_2.patched_process_image_path
        L1_2 = L1_2(L2_2)
        if L1_2 then
          L1_2 = L16_1
          L1_2 = L1_2.FINISH
          return L1_2
        end
        L1_2 = L16_1
        L1_2 = L1_2.CHECK_PATH
        return L1_2
      end
      
      function L19_1(A0_2)
        local L1_2, L2_2
        L1_2 = isnull
        L2_2 = A0_2
        L1_2 = L1_2(L2_2)
        if L1_2 then
          L1_2 = mp
          L1_2 = L1_2.CLEAN
          return L1_2
        end
        L1_2 = MpCommon
        L1_2 = L1_2.PathToWin32Path
        L2_2 = A0_2.patched_process_image_path
        L1_2 = L1_2(L2_2)
        A0_2.patched_process_image_path = L1_2
        L1_2 = isnull
        L2_2 = A0_2.patched_process_image_path
        L1_2 = L1_2(L2_2)
        if L1_2 then
          L1_2 = L16_1
          L1_2 = L1_2.FINISH
          return L1_2
        end
        L1_2 = string
        L1_2 = L1_2.lower
        L2_2 = A0_2.patched_process_image_path
        L1_2 = L1_2(L2_2)
        A0_2.patched_process_image_path = L1_2
        L1_2 = isnull
        L2_2 = A0_2.patched_process_image_path
        L1_2 = L1_2(L2_2)
        if L1_2 then
          L1_2 = L16_1
          L1_2 = L1_2.FINISH
          return L1_2
        end
        L1_2 = L16_1
        L1_2 = L1_2.GET_PROC_INFO
        return L1_2
      end
      
      function L20_1(A0_2)
        local L1_2, L2_2, L3_2
        L1_2 = isnull
        L2_2 = A0_2
        L1_2 = L1_2(L2_2)
        if L1_2 then
          L1_2 = mp
          L1_2 = L1_2.CLEAN
          return L1_2
        end
        L1_2 = isnull
        L2_2 = A0_2.patched_process_stats
        L1_2 = L1_2(L2_2)
        if L1_2 then
          L1_2 = L16_1
          L1_2 = L1_2.FINISH
          return L1_2
        end
        L1_2 = A0_2.patched_process_stats
        L1_2 = L1_2.command_line
        L2_2 = isnull
        L3_2 = A0_2.patched_process_ppid
        L2_2 = L2_2(L3_2)
        if not L2_2 then
          L2_2 = isnull
          L3_2 = L1_2
          L2_2 = L2_2(L3_2)
          if not L2_2 then
            goto lbl_32
          end
        end
        L2_2 = L16_1
        L2_2 = L2_2.FINISH
        do return L2_2 end
        ::lbl_32::
        A0_2.patched_process_command_line = L1_2
        L2_2 = L16_1
        L2_2 = L2_2.GET_ROUTINE_ADDR
        return L2_2
      end
      
      function L21_1(A0_2)
        local L1_2, L2_2
        L1_2 = isnull
        L2_2 = A0_2
        L1_2 = L1_2(L2_2)
        if L1_2 then
          L1_2 = mp
          L1_2 = L1_2.CLEAN
          return L1_2
        end
        L1_2 = isnull
        L2_2 = A0_2.patched_amsi_routine_addr
        L1_2 = L1_2(L2_2)
        if L1_2 then
          L1_2 = L16_1
          L1_2 = L1_2.FINISH
          return L1_2
        end
        L1_2 = L16_1
        L1_2 = L1_2.READ_MEM
        return L1_2
      end
      
      function L22_1(A0_2)
        local L1_2, L2_2, L3_2, L4_2
        L1_2 = isnull
        L2_2 = A0_2
        L1_2 = L1_2(L2_2)
        if L1_2 then
          L1_2 = mp
          L1_2 = L1_2.CLEAN
          return L1_2
        end
        L1_2 = bm
        L1_2 = L1_2.ReadProcMem
        L2_2 = A0_2.patched_amsi_routine_addr
        L3_2 = 256
        L4_2 = A0_2.patched_process_ppid
        L1_2 = L1_2(L2_2, L3_2, L4_2)
        L2_2 = isnull
        L3_2 = L1_2
        L2_2 = L2_2(L3_2)
        if L2_2 then
          L2_2 = L16_1
          L2_2 = L2_2.FINISH
          return L2_2
        end
        L2_2 = tohex
        L3_2 = tostring
        L4_2 = L1_2
        L3_2, L4_2 = L3_2(L4_2)
        L2_2 = L2_2(L3_2, L4_2)
        L1_1 = L2_2
        A0_2.raw_bytes = L1_2
        L2_2 = L16_1
        L2_2 = L2_2.DETECT_ARCH
        return L2_2
      end
      
      function L23_1(A0_2)
        local L1_2, L2_2
        L1_2 = isnull
        L2_2 = A0_2
        L1_2 = L1_2(L2_2)
        if L1_2 then
          L1_2 = mp
          L1_2 = L1_2.CLEAN
          return L1_2
        end
        L1_2 = A0_2.patched_amsi_routine_addr
        if 4294967295 < L1_2 then
          L1_2 = mp
          L1_2 = L1_2.SMS_PROC_ARCH_X64
          A0_2.arch_information = L1_2
        else
          L1_2 = mp
          L1_2 = L1_2.SMS_PROC_ARCH_X32
          A0_2.arch_information = L1_2
        end
        L1_2 = L16_1
        L1_2 = L1_2.DISASSEMBLE
        return L1_2
      end
      
      function L24_1(A0_2)
        local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
        L1_2 = isnull
        L2_2 = A0_2
        L1_2 = L1_2(L2_2)
        if L1_2 then
          L1_2 = mp
          L1_2 = L1_2.CLEAN
          return L1_2
        end
        L1_2 = mp
        L1_2 = L1_2.x86dasm
        L2_2 = A0_2.arch_information
        L3_2 = A0_2.patched_amsi_routine_addr
        L4_2 = A0_2.raw_bytes
        L5_2 = 256
        L6_2 = 50
        L7_2 = A0_2.patched_amsi_routine_addr
        L8_2 = mp
        L8_2 = L8_2.DASM_LINEAR_FLOW
        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
        L2_2 = isnull
        L3_2 = L1_2
        L2_2 = L2_2(L3_2)
        if L2_2 then
          L2_2 = L16_1
          L2_2 = L2_2.FINISH
          return L2_2
        end
        A0_2.disassembled_instructions = L1_2
        L2_2 = L16_1
        L2_2 = L2_2.ANALYZE
        return L2_2
      end
      
      function L25_1(A0_2)
        local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
        L1_2 = isnull
        L2_2 = A0_2
        L1_2 = L1_2(L2_2)
        if L1_2 then
          L1_2 = mp
          L1_2 = L1_2.CLEAN
          return L1_2
        end
        L1_2 = pairs
        L2_2 = A0_2.disassembled_instructions
        L1_2, L2_2, L3_2 = L1_2(L2_2)
        for L4_2, L5_2 in L1_2, L2_2, L3_2 do
          L6_2 = L5_2.opcode
          if L6_2 ~= 235 then
            L6_2 = L5_2.opcode
            if L6_2 ~= 195 then
              L6_2 = L5_2.opcode
              if L6_2 ~= 194 then
                L6_2 = L5_2.opcode
                if L6_2 ~= 49 then
                  goto lbl_63
                end
              end
            end
          end
          L6_2 = string
          L6_2 = L6_2.format
          L7_2 = "[->] Function %s at 0x%02x, cpu is %d"
          L8_2 = A0_2.chosen_amsi_routine_name
          L9_2 = A0_2.patched_amsi_routine_addr
          L10_2 = A0_2.arch_information
          L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
          L7_2 = bm
          L7_2 = L7_2.add_related_string
          L8_2 = "[->] MEDICATED PROCESS: "
          L9_2 = A0_2.patched_process_image_path
          L10_2 = bm
          L10_2 = L10_2.RelatedStringBMReport
          L7_2(L8_2, L9_2, L10_2)
          L7_2 = bm
          L7_2 = L7_2.add_related_string
          L8_2 = "[->] MEDICATED COMMAND LINE: "
          L9_2 = A0_2.patched_process_command_line
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
          L9_2 = L1_1
          L10_2 = bm
          L10_2 = L10_2.RelatedStringBMReport
          L7_2(L8_2, L9_2, L10_2)
          L7_2 = mp
          L7_2 = L7_2.INFECTED
          do return L7_2 end
          ::lbl_63::
        end
        L1_2 = L16_1
        L1_2 = L1_2.FINISH
        return L1_2
      end
      
      function L26_1(A0_2)
        local L1_2
        L1_2 = mp
        L1_2 = L1_2.CLEAN
        return L1_2
      end
      
      L27_1 = {}
      L28_1 = L16_1.INIT
      L27_1[L28_1] = L18_1
      L28_1 = L16_1.CHECK_PATH
      L27_1[L28_1] = L19_1
      L28_1 = L16_1.GET_PROC_INFO
      L27_1[L28_1] = L20_1
      L28_1 = L16_1.GET_ROUTINE_ADDR
      L27_1[L28_1] = L21_1
      L28_1 = L16_1.READ_MEM
      L27_1[L28_1] = L22_1
      L28_1 = L16_1.DETECT_ARCH
      L27_1[L28_1] = L23_1
      L28_1 = L16_1.DISASSEMBLE
      L27_1[L28_1] = L24_1
      L28_1 = L16_1.ANALYZE
      L27_1[L28_1] = L25_1
      L28_1 = L16_1.FINISH
      L27_1[L28_1] = L26_1
      while true do
        L28_1 = L17_1.current_state
        L28_1 = L27_1[L28_1]
        if not L28_1 then
          L29_1 = mp
          L29_1 = L29_1.CLEAN
          return L29_1
        end
        L29_1 = L28_1
        L30_1 = L17_1
        L29_1 = L29_1(L30_1)
        L30_1 = mp
        L30_1 = L30_1.INFECTED
        if L29_1 == L30_1 then
          L30_1 = mp
          L30_1 = L30_1.INFECTED
          return L30_1
        else
          L30_1 = mp
          L30_1 = L30_1.CLEAN
          if L29_1 == L30_1 then
            break
          else
            L30_1 = type
            L31_1 = L29_1
            L30_1 = L30_1(L31_1)
            if L30_1 ~= "number" then
              L30_1 = mp
              L30_1 = L30_1.CLEAN
              return L30_1
            end
          end
        end
        L17_1.current_state = L29_1
        L30_1 = L17_1.current_state
        L31_1 = L16_1.FINISH
        if L30_1 == L31_1 then
          break
        end
      end
      L28_1 = mp
      L28_1 = L28_1.CLEAN
      return L28_1
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
