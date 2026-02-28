local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = {}
L0_1.INIT = 1
L0_1.CHECK_PATH = 2
L0_1.GET_PROC_INFO = 3
L0_1.GET_ROUTINE_ADDR = 4
L0_1.READ_MEM = 5
L0_1.DETECT_ARCH = 6
L0_1.DISASSEMBLE = 7
L0_1.ANALYZE = 8
L0_1.FINISH = 9
L1_1 = L0_1.INIT
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = {}
L7_1 = "AmsiOpenSession"
L6_1[1] = L7_1
L7_1 = nil
L8_1 = nil
L9_1 = nil
L10_1 = nil
L11_1 = nil
while true do
  L12_1 = L0_1.INIT
  if L1_1 == L12_1 then
    L12_1 = bm
    L12_1 = L12_1.get_imagepath
    L12_1 = L12_1()
    L2_1 = L12_1
    L12_1 = isnull
    L13_1 = L2_1
    L12_1 = L12_1(L13_1)
    if L12_1 then
      L1_1 = L0_1.FINISH
    else
      L1_1 = L0_1.CHECK_PATH
    end
  else
    L12_1 = L0_1.CHECK_PATH
    if L1_1 == L12_1 then
      L12_1 = MpCommon
      L12_1 = L12_1.PathToWin32Path
      L13_1 = L2_1
      L12_1 = L12_1(L13_1)
      L2_1 = L12_1
      L12_1 = isnull
      L13_1 = L2_1
      L12_1 = L12_1(L13_1)
      if L12_1 then
        L1_1 = L0_1.FINISH
      else
        L12_1 = string
        L12_1 = L12_1.lower
        L13_1 = L2_1
        L12_1 = L12_1(L13_1)
        L2_1 = L12_1
        L12_1 = isnull
        L13_1 = L2_1
        L12_1 = L12_1(L13_1)
        if L12_1 then
          L1_1 = L0_1.FINISH
        else
          L1_1 = L0_1.GET_PROC_INFO
        end
      end
    else
      L12_1 = L0_1.GET_PROC_INFO
      if L1_1 == L12_1 then
        L12_1 = bm
        L12_1 = L12_1.get_current_process_startup_info
        L12_1 = L12_1()
        L3_1 = L12_1
        L12_1 = isnull
        L13_1 = L3_1
        L12_1 = L12_1(L13_1)
        if L12_1 then
          L1_1 = L0_1.FINISH
        else
          L4_1 = L3_1.command_line
          L5_1 = L3_1.ppid
          L12_1 = isnull
          L13_1 = L5_1
          L12_1 = L12_1(L13_1)
          if not L12_1 then
            L12_1 = isnull
            L13_1 = L4_1
            L12_1 = L12_1(L13_1)
            if not L12_1 then
              goto lbl_90
            end
          end
          L1_1 = L0_1.FINISH
          goto lbl_218
          ::lbl_90::
          L1_1 = L0_1.GET_ROUTINE_ADDR
        end
      else
        L12_1 = L0_1.GET_ROUTINE_ADDR
        if L1_1 == L12_1 then
          L7_1 = L6_1[1]
          L12_1 = bm
          L12_1 = L12_1.GetProcAddress
          L13_1 = L5_1
          L14_1 = "amsi.dll"
          L15_1 = L7_1
          L12_1 = L12_1(L13_1, L14_1, L15_1)
          L8_1 = L12_1
          L12_1 = isnull
          L13_1 = L8_1
          L12_1 = L12_1(L13_1)
          if L12_1 then
            L1_1 = L0_1.FINISH
          else
            L1_1 = L0_1.READ_MEM
          end
        else
          L12_1 = L0_1.READ_MEM
          if L1_1 == L12_1 then
            L12_1 = bm
            L12_1 = L12_1.ReadProcMem
            L13_1 = L8_1
            L14_1 = 64000
            L15_1 = L5_1
            L12_1 = L12_1(L13_1, L14_1, L15_1)
            L9_1 = L12_1
            L12_1 = isnull
            L13_1 = L9_1
            L12_1 = L12_1(L13_1)
            if L12_1 then
              L1_1 = L0_1.FINISH
            else
              L1_1 = L0_1.DETECT_ARCH
            end
          else
            L12_1 = L0_1.DETECT_ARCH
            if L1_1 == L12_1 then
              if 4294967295 < L8_1 then
                L12_1 = mp
                L10_1 = L12_1.SMS_PROC_ARCH_X64
              else
                L12_1 = mp
                L10_1 = L12_1.SMS_PROC_ARCH_X32
              end
              L1_1 = L0_1.DISASSEMBLE
            else
              L12_1 = L0_1.DISASSEMBLE
              if L1_1 == L12_1 then
                L12_1 = mp
                L12_1 = L12_1.x86dasm
                L13_1 = L10_1
                L14_1 = L8_1
                L15_1 = L9_1
                L16_1 = 64000
                L17_1 = 100
                L18_1 = L8_1
                L19_1 = mp
                L19_1 = L19_1.DASM_LINEAR_FLOW
                L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
                L11_1 = L12_1
                L12_1 = isnull
                L13_1 = L11_1
                L12_1 = L12_1(L13_1)
                if L12_1 then
                  L1_1 = L0_1.FINISH
                else
                  L1_1 = L0_1.ANALYZE
                end
              else
                L12_1 = L0_1.ANALYZE
                if L1_1 == L12_1 then
                  L12_1 = pairs
                  L13_1 = L11_1
                  L12_1, L13_1, L14_1 = L12_1(L13_1)
                  for L15_1, L16_1 in L12_1, L13_1, L14_1 do
                    L17_1 = L16_1.opcode
                    if L17_1 == 235 then
                      L17_1 = string
                      L17_1 = L17_1.format
                      L18_1 = "[->] Function %s at 0x%02x, cpu is %d"
                      L19_1 = L7_1
                      L20_1 = L8_1
                      L21_1 = L10_1
                      L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
                      L18_1 = bm
                      L18_1 = L18_1.add_related_string
                      L19_1 = "[->] MEDICATED PROCESS: "
                      L20_1 = L2_1
                      L21_1 = bm
                      L21_1 = L21_1.RelatedStringBMReport
                      L18_1(L19_1, L20_1, L21_1)
                      L18_1 = bm
                      L18_1 = L18_1.add_related_string
                      L19_1 = "[->] MEDICATED COMMAND LINE: "
                      L20_1 = L4_1
                      L21_1 = bm
                      L21_1 = L21_1.RelatedStringBMReport
                      L18_1(L19_1, L20_1, L21_1)
                      L18_1 = bm
                      L18_1 = L18_1.add_related_string
                      L19_1 = "[->] MEDICATED DETAILS"
                      L20_1 = L17_1
                      L21_1 = bm
                      L21_1 = L21_1.RelatedStringBMReport
                      L18_1(L19_1, L20_1, L21_1)
                      L18_1 = mp
                      L18_1 = L18_1.INFECTED
                      return L18_1
                    end
                  end
                  L1_1 = L0_1.FINISH
                else
                  L12_1 = L0_1.FINISH
                  if L1_1 == L12_1 then
                    L12_1 = mp
                    L12_1 = L12_1.CLEAN
                    return L12_1
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  ::lbl_218::
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
