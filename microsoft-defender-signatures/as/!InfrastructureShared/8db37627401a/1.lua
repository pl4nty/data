local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L0_1, L1_1, L2_1 = L0_1(L1_1)
if L0_1 then
  L3_1 = ipairs
  L4_1 = L1_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1.image_path
    if L8_1 ~= nil then
      L8_1 = mp
      L8_1 = L8_1.bitand
      L9_1 = L7_1.reason_ex
      L10_1 = 1
      L8_1 = L8_1(L9_1, L10_1)
      if L8_1 == 1 then
        L8_1 = L7_1.ppid
        if L8_1 ~= nil then
          L8_1 = bm
          L8_1 = L8_1.trigger_sig
          L9_1 = "DumpADConnectCreds"
          L10_1 = "THREAT"
          L11_1 = L7_1.ppid
          L8_1(L9_1, L10_1, L11_1)
          L8_1 = string
          L8_1 = L8_1.lower
          L9_1 = L7_1.image_path
          L8_1 = L8_1(L9_1)
          L9_1 = string
          L9_1 = L9_1.find
          L10_1 = L8_1
          L11_1 = "powershell.exe"
          L12_1 = 1
          L13_1 = true
          L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
          if not L9_1 then
            L9_1 = string
            L9_1 = L9_1.find
            L10_1 = L8_1
            L11_1 = "cmd.exe"
            L12_1 = 1
            L13_1 = true
            L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
            if not L9_1 then
              goto lbl_56
            end
          end
          L9_1 = bm
          L9_1 = L9_1.add_threat_process
          L10_1 = L7_1.ppid
          L9_1(L10_1)
        end
      end
    end
    ::lbl_56::
  end
end
L3_1 = pcall
L4_1 = reportBmInfo
L3_1, L4_1 = L3_1(L4_1)
if not L3_1 and L4_1 then
  L5_1 = bm
  L5_1 = L5_1.add_related_string
  L6_1 = "bmInfoFailReason"
  L7_1 = tostring
  L8_1 = L4_1
  L7_1 = L7_1(L8_1)
  L8_1 = bm
  L8_1 = L8_1.RelatedStringBMReport
  L5_1(L6_1, L7_1, L8_1)
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
