local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = bm
    L0_1 = L0_1.GetSignatureMatchDuration
    L0_1 = L0_1()
    if 30000000 < L0_1 then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p2
    L1_1 = L0_1
    L0_1 = L0_1.lower
    L0_1 = L0_1(L1_1)
    L1_1 = #L0_1
    if L1_1 < 32 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\\\\tsclient\\"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "d:\\"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "claude.ai/install"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "openclaw.ai/install"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = "runpscommand"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if not L1_1 then
              goto lbl_78
            end
          end
        end
      end
    end
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    do return L1_1 end
    ::lbl_78::
    L1_1 = string
    L1_1 = L1_1.gsub
    L2_1 = L0_1
    L3_1 = "\\1$"
    L4_1 = ""
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    L0_1 = L1_1
    L1_1 = L0_1
    L2_1 = mp
    L2_1 = L2_1.ContextualExpandEnvironmentVariables
    L3_1 = L0_1
    L2_1 = L2_1(L3_1)
    L3_1 = L2_1
    L2_1 = L2_1.lower
    L2_1 = L2_1(L3_1)
    L3_1 = 1
    L4_1 = 5
    L5_1 = 1
    for L6_1 = L3_1, L4_1, L5_1 do
      if L1_1 == L2_1 then
        break
      else
        L1_1 = L2_1
        L7_1 = mp
        L7_1 = L7_1.ContextualExpandEnvironmentVariables
        L8_1 = L2_1
        L7_1 = L7_1(L8_1)
        L8_1 = L7_1
        L7_1 = L7_1.lower
        L7_1 = L7_1(L8_1)
        L2_1 = L7_1
      end
    end
    L0_1 = L2_1
    L3_1 = #L0_1
    L3_1 = L3_1 / 2
    L4_1 = string
    L4_1 = L4_1.sub
    L5_1 = L0_1
    L6_1 = -L3_1
    L4_1 = L4_1(L5_1, L6_1)
    L5_1 = bm
    L5_1 = L5_1.get_process_relationships
    L5_1, L6_1 = L5_1()
    L7_1 = ipairs
    L8_1 = L6_1
    L7_1, L8_1, L9_1 = L7_1(L8_1)
    for L10_1, L11_1 in L7_1, L8_1, L9_1 do
      L12_1 = mp
      L12_1 = L12_1.bitand
      L13_1 = L11_1.reason_ex
      L14_1 = bm
      L14_1 = L14_1.RELATIONSHIP_CREATED
      L12_1 = L12_1(L13_1, L14_1)
      L13_1 = bm
      L13_1 = L13_1.RELATIONSHIP_CREATED
      if L12_1 == L13_1 then
        L13_1 = string
        L13_1 = L13_1.lower
        L14_1 = L11_1.cmd_line
        L13_1 = L13_1(L14_1)
        L14_1 = string
        L14_1 = L14_1.sub
        L15_1 = L13_1
        L16_1 = -L3_1
        L14_1 = L14_1(L15_1, L16_1)
        if L4_1 ~= L14_1 then
          L15_1 = string
          L15_1 = L15_1.find
          L16_1 = L0_1
          L17_1 = L14_1
          L18_1 = 1
          L19_1 = true
          L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
          if not L15_1 then
            goto lbl_188
          end
        end
        L15_1 = bm
        L15_1 = L15_1.trigger_sig
        L16_1 = "StartedViaRUNMRU.gen"
        L17_1 = "StartedViaRUNMRU.gen"
        L18_1 = L11_1.ppid
        L15_1(L16_1, L17_1, L18_1)
        L15_1 = bm
        L15_1 = L15_1.trigger_sig_target_propagate
        L16_1 = "ProcessChainViaRUNMRU"
        L17_1 = "ProcessChainViaRUNMRU"
        L18_1 = L11_1.ppid
        L15_1(L16_1, L17_1, L18_1)
        L15_1 = MpCommon
        L15_1 = L15_1.DoesProcessHaveAttribute
        L16_1 = L11_1.ppid
        L17_1 = "StartedViaRUNMRU"
        L15_1 = L15_1(L16_1, L17_1)
        if not L15_1 then
          L15_1 = MpCommon
          L15_1 = L15_1.AddProcessAttribute
          L16_1 = L11_1.ppid
          L17_1 = "StartedViaRUNMRU"
          L18_1 = tostring
          L19_1 = L13_1
          L18_1 = L18_1(L19_1)
          L19_1 = true
          L15_1(L16_1, L17_1, L18_1, L19_1)
        end
        L15_1 = AppendToRollingQueue
        L16_1 = "IsProcessChainViaRUNMRU"
        L17_1 = L11_1.ppid
        L18_1 = 1
        L19_1 = 30
        L15_1(L16_1, L17_1, L18_1, L19_1)
      end
      ::lbl_188::
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
