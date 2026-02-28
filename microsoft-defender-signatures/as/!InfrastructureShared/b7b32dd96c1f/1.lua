local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L1_1 = bm
L1_1 = L1_1.GetSignatureMatchDuration
L1_1 = L1_1()
if 30000000 < L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
  end
end
L1_1 = #L0_1
if L1_1 < 70 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.sub
L3_1 = 1
L4_1 = -2
L1_1 = L1_1(L2_1, L3_1, L4_1)
L0_1 = L1_1

function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = {}
  L3_2 = 1
  L4_2 = #A1_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = A1_2[L6_2]
    L2_2[L7_2] = true
  end
  L3_2 = 0
  L4_2 = 1
  L5_2 = #A0_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = A0_2[L7_2]
    L8_2 = L2_2[L8_2]
    if L8_2 then
      L3_2 = L3_2 + 1
    end
  end
  return L3_2
end

L2_1 = bm
L2_1 = L2_1.get_process_relationships
L2_1, L3_1 = L2_1()
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = mp
  L9_1 = L9_1.bitand
  L10_1 = L8_1.reason_ex
  L11_1 = bm
  L11_1 = L11_1.RELATIONSHIP_CREATED
  L9_1 = L9_1(L10_1, L11_1)
  L10_1 = bm
  L10_1 = L10_1.RELATIONSHIP_CREATED
  if L9_1 == L10_1 then
    L10_1 = L8_1.cmd_line
    L11_1 = L8_1.ppid
    if not L11_1 then
      L11_1 = ""
    end
    L12_1 = pcall
    L13_1 = MpCommon
    L13_1 = L13_1.CommandLineToArgv
    L14_1 = L10_1
    L12_1, L13_1 = L12_1(L13_1, L14_1)
    L14_1 = pcall
    L15_1 = MpCommon
    L15_1 = L15_1.CommandLineToArgv
    L16_1 = L0_1
    L14_1, L15_1 = L14_1(L15_1, L16_1)
    if L12_1 then
      L16_1 = isnull
      L17_1 = L13_1
      L16_1 = L16_1(L17_1)
      if not L16_1 then
        L16_1 = type
        L17_1 = L13_1
        L16_1 = L16_1(L17_1)
        if L16_1 == "table" then
          L16_1 = isnull
          L17_1 = #L13_1
          L16_1 = L16_1(L17_1)
          if not L16_1 then
            goto lbl_86
          end
        end
      end
    end
    L16_1 = mp
    L16_1 = L16_1.CLEAN
    do return L16_1 end
    ::lbl_86::
    if L14_1 then
      L16_1 = isnull
      L17_1 = L15_1
      L16_1 = L16_1(L17_1)
      if not L16_1 then
        L16_1 = type
        L17_1 = L15_1
        L16_1 = L16_1(L17_1)
        if L16_1 == "table" then
          L16_1 = isnull
          L17_1 = #L15_1
          L16_1 = L16_1(L17_1)
          if not L16_1 then
            goto lbl_106
          end
        end
      end
    end
    L16_1 = mp
    L16_1 = L16_1.CLEAN
    do return L16_1 end
    ::lbl_106::
    L16_1 = #L13_1
    if L16_1 ~= 1 then
      L16_1 = L13_1[1]
      if L16_1 ~= nil then
        goto lbl_115
      end
    end
    L16_1 = mp
    L16_1 = L16_1.CLEAN
    do return L16_1 end
    ::lbl_115::
    L16_1 = #L15_1
    if L16_1 ~= 1 then
      L16_1 = L15_1[1]
      if L16_1 ~= nil then
        goto lbl_124
      end
    end
    L16_1 = mp
    L16_1 = L16_1.CLEAN
    do return L16_1 end
    ::lbl_124::
    L16_1 = #L15_1
    L17_1 = #L13_1
    if L16_1 ~= L17_1 then
      L16_1 = mp
      L16_1 = L16_1.CLEAN
      return L16_1
    end
    L16_1 = bm
    L16_1 = L16_1.add_related_string
    L17_1 = "RegRunMRU"
    L18_1 = tostring
    L19_1 = L0_1
    L18_1 = L18_1(L19_1)
    L19_1 = bm
    L19_1 = L19_1.RelatedStringBMReport
    L16_1(L17_1, L18_1, L19_1)
    L16_1 = L1_1
    L17_1 = L15_1
    L18_1 = L13_1
    L16_1 = L16_1(L17_1, L18_1)
    L17_1 = #L13_1
    L17_1 = L17_1 - 1
    if L16_1 ~= L17_1 then
      L17_1 = mp
      L17_1 = L17_1.CLEAN
      return L17_1
    end
    if L11_1 then
      L17_1 = bm
      L17_1 = L17_1.trigger_sig_target_propagate
      L18_1 = "ProcRunMRU"
      L19_1 = L10_1
      L20_1 = L11_1
      L17_1(L18_1, L19_1, L20_1)
    end
    L17_1 = mp
    L17_1 = L17_1.INFECTED
    return L17_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
