local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
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
L1_1 = this_sigattrlog
L1_1 = L1_1[8]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[8]
  L0_1 = L1_1.utf8p2
end
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "^([0-9]+);regionsize:([0-9]+)"
L1_1, L2_1 = L1_1(L2_1, L3_1)
L3_1 = isnull
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_48
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_48::
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
L5_1 = "EtwEventWrite"
L6_1 = bm
L6_1 = L6_1.GetProcAddress
L7_1 = L4_1
L8_1 = "ntdll.dll"
L9_1 = L5_1
L6_1 = L6_1(L7_1, L8_1, L9_1)
L7_1 = isnull
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = bm
L7_1 = L7_1.VirtualQuery
L8_1 = L6_1
L7_1, L8_1 = L7_1(L8_1)
if L7_1 then
  L9_1 = isnull
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  if not L9_1 then
    goto lbl_97
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_97::
L9_1 = L8_1.base_addr
if L9_1 == L1_1 then
  L9_1 = bm
  L9_1 = L9_1.get_imagepath
  L9_1 = L9_1()
  L10_1 = isnull
  L11_1 = L9_1
  L10_1 = L10_1(L11_1)
  if L10_1 then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
  L10_1 = checkFileLastWriteTime
  L11_1 = L9_1
  L12_1 = 300
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 then
    L10_1 = {}
    L10_1.INIT = 1
    L10_1.CHECK_PATH = 2
    L10_1.GET_PROC_INFO = 3
    L10_1.GET_ROUTINE_ADDR = 4
    L10_1.READ_MEM = 5
    L10_1.DETECT_ARCH = 6
    L10_1.DISASSEMBLE = 7
    L10_1.ANALYZE = 8
    L10_1.FINISH = 9
    L11_1 = L10_1.INIT
    L12_1 = nil
    L13_1 = nil
    L14_1 = nil
    L15_1 = nil
    while true do
      L16_1 = L10_1.INIT
      if L11_1 == L16_1 then
        L16_1 = isnull
        L17_1 = L9_1
        L16_1 = L16_1(L17_1)
        if L16_1 then
          L11_1 = L10_1.FINISH
        else
          L11_1 = L10_1.CHECK_PATH
        end
      else
        L16_1 = L10_1.CHECK_PATH
        if L11_1 == L16_1 then
          L16_1 = MpCommon
          L16_1 = L16_1.PathToWin32Path
          L17_1 = L9_1
          L16_1 = L16_1(L17_1)
          L9_1 = L16_1
          L16_1 = isnull
          L17_1 = L9_1
          L16_1 = L16_1(L17_1)
          if L16_1 then
            L11_1 = L10_1.FINISH
          else
            L16_1 = string
            L16_1 = L16_1.lower
            L17_1 = L9_1
            L16_1 = L16_1(L17_1)
            L9_1 = L16_1
            L16_1 = isnull
            L17_1 = L9_1
            L16_1 = L16_1(L17_1)
            if L16_1 then
              L11_1 = L10_1.FINISH
            else
              L11_1 = L10_1.GET_PROC_INFO
            end
          end
        else
          L16_1 = L10_1.GET_PROC_INFO
          if L11_1 == L16_1 then
            L16_1 = isnull
            L17_1 = L3_1
            L16_1 = L16_1(L17_1)
            if L16_1 then
              L11_1 = L10_1.FINISH
            else
              L12_1 = L3_1.command_line
              L16_1 = isnull
              L17_1 = L4_1
              L16_1 = L16_1(L17_1)
              if not L16_1 then
                L16_1 = isnull
                L17_1 = L12_1
                L16_1 = L16_1(L17_1)
                if not L16_1 then
                  goto lbl_193
                end
              end
              L11_1 = L10_1.FINISH
              goto lbl_316
              ::lbl_193::
              L11_1 = L10_1.GET_ROUTINE_ADDR
            end
          else
            L16_1 = L10_1.GET_ROUTINE_ADDR
            if L11_1 == L16_1 then
              L16_1 = isnull
              L17_1 = L6_1
              L16_1 = L16_1(L17_1)
              if L16_1 then
                L11_1 = L10_1.FINISH
              else
                L11_1 = L10_1.READ_MEM
              end
            else
              L16_1 = L10_1.READ_MEM
              if L11_1 == L16_1 then
                L16_1 = bm
                L16_1 = L16_1.ReadProcMem
                L17_1 = L6_1
                L18_1 = 64000
                L19_1 = L4_1
                L16_1 = L16_1(L17_1, L18_1, L19_1)
                L13_1 = L16_1
                L16_1 = isnull
                L17_1 = L13_1
                L16_1 = L16_1(L17_1)
                if L16_1 then
                  L11_1 = L10_1.FINISH
                else
                  L11_1 = L10_1.DETECT_ARCH
                end
              else
                L16_1 = L10_1.DETECT_ARCH
                if L11_1 == L16_1 then
                  if 4294967295 < L6_1 then
                    L16_1 = mp
                    L14_1 = L16_1.SMS_PROC_ARCH_X64
                  else
                    L16_1 = mp
                    L14_1 = L16_1.SMS_PROC_ARCH_X32
                  end
                  L11_1 = L10_1.DISASSEMBLE
                else
                  L16_1 = L10_1.DISASSEMBLE
                  if L11_1 == L16_1 then
                    L16_1 = mp
                    L16_1 = L16_1.x86dasm
                    L17_1 = L14_1
                    L18_1 = L6_1
                    L19_1 = L13_1
                    L20_1 = 64000
                    L21_1 = 100
                    L22_1 = L6_1
                    L23_1 = mp
                    L23_1 = L23_1.DASM_LINEAR_FLOW
                    L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
                    L15_1 = L16_1
                    L16_1 = isnull
                    L17_1 = L15_1
                    L16_1 = L16_1(L17_1)
                    if L16_1 then
                      L11_1 = L10_1.FINISH
                    else
                      L11_1 = L10_1.ANALYZE
                    end
                  else
                    L16_1 = L10_1.ANALYZE
                    if L11_1 == L16_1 then
                      L16_1 = pairs
                      L17_1 = L15_1
                      L16_1, L17_1, L18_1 = L16_1(L17_1)
                      for L19_1, L20_1 in L16_1, L17_1, L18_1 do
                        L21_1 = L20_1.opcode
                        if L21_1 ~= 195 then
                          L21_1 = L20_1.opcode
                          if L21_1 ~= 194 then
                            goto lbl_306
                          end
                        end
                        L21_1 = string
                        L21_1 = L21_1.format
                        L22_1 = "[->] Function %s at 0x%02x, cpu is %d"
                        L23_1 = L5_1
                        L24_1 = L6_1
                        L25_1 = L14_1
                        L21_1 = L21_1(L22_1, L23_1, L24_1, L25_1)
                        L22_1 = bm
                        L22_1 = L22_1.add_related_string
                        L23_1 = "[->] MEDICATED PROCESS: "
                        L24_1 = L9_1
                        L25_1 = bm
                        L25_1 = L25_1.RelatedStringBMReport
                        L22_1(L23_1, L24_1, L25_1)
                        L22_1 = bm
                        L22_1 = L22_1.add_related_string
                        L23_1 = "[->] MEDICATED COMMAND LINE: "
                        L24_1 = L12_1
                        L25_1 = bm
                        L25_1 = L25_1.RelatedStringBMReport
                        L22_1(L23_1, L24_1, L25_1)
                        L22_1 = bm
                        L22_1 = L22_1.add_related_string
                        L23_1 = "[->] MEDICATED DETAILS"
                        L24_1 = L21_1
                        L25_1 = bm
                        L25_1 = L25_1.RelatedStringBMReport
                        L22_1(L23_1, L24_1, L25_1)
                        L22_1 = mp
                        L22_1 = L22_1.INFECTED
                        do return L22_1 end
                        ::lbl_306::
                      end
                      L11_1 = L10_1.FINISH
                    else
                      L16_1 = L10_1.FINISH
                      if L11_1 == L16_1 then
                        L16_1 = mp
                        L16_1 = L16_1.CLEAN
                        return L16_1
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      ::lbl_316::
    end
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
