local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = "ExecutableNonTextSection"
L1_1 = {}
L2_1 = pehdr
L2_1 = L2_1.NumberOfSections
if L2_1 <= 1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
L2_1 = L2_1(L3_1)
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = mp
L4_1 = L4_1.getfilename
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L4_1()
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
if not L2_1 or not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = 1
L5_1 = pehdr
L5_1 = L5_1.NumberOfSections
L6_1 = 1
for L7_1 = L4_1, L5_1, L6_1 do
  L8_1 = pesecs
  L8_1 = L8_1[L7_1]
  L8_1 = L8_1.Name
  if L8_1 ~= ".text" then
    L8_1 = pesecs
    L8_1 = L8_1[L7_1]
    L8_1 = L8_1.Characteristics
    if L8_1 == 1610612768 then
      L8_1 = mp
      L8_1 = L8_1.readfile
      L9_1 = pesecs
      L9_1 = L9_1[L7_1]
      L9_1 = L9_1.PointerToRawData
      L10_1 = pesecs
      L10_1 = L10_1[L7_1]
      L10_1 = L10_1.SizeOfRawData
      L8_1 = L8_1(L9_1, L10_1)
      if L8_1 ~= nil then
        L9_1 = #L8_1
        if 256 < L9_1 then
          L9_1 = mp
          L9_1 = L9_1.readu_u16
          L10_1 = L8_1
          L11_1 = 1
          L9_1 = L9_1(L10_1, L11_1)
          if L9_1 == 23117 then
            L9_1 = mp
            L9_1 = L9_1.vfo_add_buffer
            L10_1 = L8_1
            L11_1 = string
            L11_1 = L11_1.format
            L12_1 = "%s_%s"
            L13_1 = L0_1
            L14_1 = pesecs
            L14_1 = L14_1[L7_1]
            L14_1 = L14_1.Name
            L11_1 = L11_1(L12_1, L13_1, L14_1)
            L12_1 = mp
            L12_1 = L12_1.ADD_VFO_TAKE_ACTION_ON_DAD
            L9_1(L10_1, L11_1, L12_1)
            L9_1 = table
            L9_1 = L9_1.insert
            L10_1 = L1_1
            L11_1 = string
            L11_1 = L11_1.format
            L12_1 = "%s_%d"
            L13_1 = pesecs
            L13_1 = L13_1[L7_1]
            L13_1 = L13_1.Name
            L14_1 = pesecs
            L14_1 = L14_1[L7_1]
            L14_1 = L14_1.SizeOfRawData
            L11_1, L12_1, L13_1, L14_1, L15_1 = L11_1(L12_1, L13_1, L14_1)
            L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
            L9_1 = MpCommon
            L9_1 = L9_1.BmTriggerSig
            L10_1 = L2_1
            L11_1 = string
            L11_1 = L11_1.format
            L12_1 = "BM_%s_OriginalPath:%s_OriginalSection:%s"
            L13_1 = L0_1
            L14_1 = L3_1
            L15_1 = pesecs
            L15_1 = L15_1[L7_1]
            L15_1 = L15_1.Name
            L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
            L12_1 = string
            L12_1 = L12_1.format
            L13_1 = "UsrName:;Domain:;RemoteIp:;FSize:%d"
            L14_1 = pesecs
            L14_1 = L14_1[L7_1]
            L14_1 = L14_1.SizeOfRawData
            L12_1, L13_1, L14_1, L15_1 = L12_1(L13_1, L14_1)
            L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = true
L4_1(L5_1)
L4_1 = #L1_1
if L4_1 == 0 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = table
L4_1 = L4_1.concat
L5_1 = L1_1
L6_1 = ","
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = string
L6_1 = L6_1.format
L7_1 = "%s_Sections=%s"
L8_1 = L0_1
L9_1 = L4_1
L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L6_1(L7_1, L8_1, L9_1)
L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
L5_1 = MpCommon
L5_1 = L5_1.SetOriginalFileName
L6_1 = L3_1
L7_1 = string
L7_1 = L7_1.format
L8_1 = "BM_%s"
L9_1 = L0_1
L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L7_1(L8_1, L9_1)
L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = "MpDisableCaching"
L5_1(L6_1)
L5_1 = AppendToRollingQueue
L6_1 = L0_1
L7_1 = L3_1
L8_1 = L4_1
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
