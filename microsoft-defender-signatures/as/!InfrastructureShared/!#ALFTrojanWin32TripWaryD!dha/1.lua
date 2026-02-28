local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "ALF:Trojan:Win32/TripWary.C!dha"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 20 or 1024 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = string
  L1_2 = L1_2.rep
  L2_2 = " "
  L3_2 = 16
  L1_2 = L1_2(L2_2, L3_2)
  L3_2 = A0_2
  L2_2 = A0_2.match
  L4_2 = ".(%x%x%x%x%x%x%x%x).(%x%x%x%x).(%x%x%x%x).(%x%x)(%x%x).(%x%x)(%x%x)(%x%x)(%x%x)(%x%x)(%x%x)"
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L2_2(L3_2, L4_2)
  L13_2 = mp
  L13_2 = L13_2.writeu_u32
  L14_2 = L1_2
  L15_2 = 1
  L16_2 = tonumber
  L17_2 = L2_2
  L18_2 = 16
  L16_2, L17_2, L18_2 = L16_2(L17_2, L18_2)
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L13_2 = mp
  L13_2 = L13_2.writeu_u16
  L14_2 = L1_2
  L15_2 = 5
  L16_2 = tonumber
  L17_2 = L3_2
  L18_2 = 16
  L16_2, L17_2, L18_2 = L16_2(L17_2, L18_2)
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L13_2 = mp
  L13_2 = L13_2.writeu_u16
  L14_2 = L1_2
  L15_2 = 7
  L16_2 = tonumber
  L17_2 = L4_2
  L18_2 = 16
  L16_2, L17_2, L18_2 = L16_2(L17_2, L18_2)
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L13_2 = mp
  L13_2 = L13_2.writeu_u8
  L14_2 = L1_2
  L15_2 = 9
  L16_2 = tonumber
  L17_2 = L5_2
  L18_2 = 16
  L16_2, L17_2, L18_2 = L16_2(L17_2, L18_2)
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L13_2 = mp
  L13_2 = L13_2.writeu_u8
  L14_2 = L1_2
  L15_2 = 10
  L16_2 = tonumber
  L17_2 = L6_2
  L18_2 = 16
  L16_2, L17_2, L18_2 = L16_2(L17_2, L18_2)
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L13_2 = mp
  L13_2 = L13_2.writeu_u8
  L14_2 = L1_2
  L15_2 = 11
  L16_2 = tonumber
  L17_2 = L7_2
  L18_2 = 16
  L16_2, L17_2, L18_2 = L16_2(L17_2, L18_2)
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L13_2 = mp
  L13_2 = L13_2.writeu_u8
  L14_2 = L1_2
  L15_2 = 12
  L16_2 = tonumber
  L17_2 = L8_2
  L18_2 = 16
  L16_2, L17_2, L18_2 = L16_2(L17_2, L18_2)
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L13_2 = mp
  L13_2 = L13_2.writeu_u8
  L14_2 = L1_2
  L15_2 = 13
  L16_2 = tonumber
  L17_2 = L9_2
  L18_2 = 16
  L16_2, L17_2, L18_2 = L16_2(L17_2, L18_2)
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L13_2 = mp
  L13_2 = L13_2.writeu_u8
  L14_2 = L1_2
  L15_2 = 14
  L16_2 = tonumber
  L17_2 = L10_2
  L18_2 = 16
  L16_2, L17_2, L18_2 = L16_2(L17_2, L18_2)
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L13_2 = mp
  L13_2 = L13_2.writeu_u8
  L14_2 = L1_2
  L15_2 = 15
  L16_2 = tonumber
  L17_2 = L11_2
  L18_2 = 16
  L16_2, L17_2, L18_2 = L16_2(L17_2, L18_2)
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L13_2 = mp
  L13_2 = L13_2.writeu_u8
  L14_2 = L1_2
  L15_2 = 16
  L16_2 = tonumber
  L17_2 = L12_2
  L18_2 = 16
  L16_2, L17_2, L18_2 = L16_2(L17_2, L18_2)
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  return L1_2
end

uuidToBytes = L1_1
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = 16
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 16
L4_1 = L0_1 - 16
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = true
L3_1(L4_1)
if L2_1 ~= nil then
  L3_1 = sysio
  L3_1 = L3_1.RegOpenKey
  L4_1 = "HKLM\\SYSTEM\\HardwareConfig"
  L3_1 = L3_1(L4_1)
  if L3_1 ~= nil then
    L4_1 = sysio
    L4_1 = L4_1.GetRegValueAsString
    L5_1 = L3_1
    L6_1 = "LastConfig"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 ~= nil then
      L6_1 = L4_1
      L5_1 = L4_1.len
      L5_1 = L5_1(L6_1)
      if L5_1 == 38 then
        L5_1 = uuidToBytes
        L6_1 = L4_1
        L5_1 = L5_1(L6_1)
        L6_1 = 1
        L7_1 = #L5_1
        L8_1 = 1
        for L9_1 = L6_1, L7_1, L8_1 do
          L10_1 = mp
          L10_1 = L10_1.writeu_u8
          L11_1 = L5_1
          L12_1 = L9_1
          L13_1 = string
          L13_1 = L13_1.byte
          L14_1 = L5_1
          L15_1 = L9_1
          L13_1 = L13_1(L14_1, L15_1)
          L14_1 = L9_1 - 1
          L13_1 = L13_1 + L14_1
          L10_1(L11_1, L12_1, L13_1)
        end
        L6_1 = ""
        L7_1 = 0
        L8_1 = 0
        L9_1 = 0
        L10_1 = 16
        L11_1 = 1
        L12_1 = #L2_1
        L13_1 = 1
        for L14_1 = L11_1, L12_1, L13_1 do
          L15_1 = string
          L15_1 = L15_1.byte
          L16_1 = L2_1
          L17_1 = L14_1
          L15_1 = L15_1(L16_1, L17_1)
          L7_1 = L15_1
          L15_1 = string
          L15_1 = L15_1.byte
          L16_1 = L5_1
          L17_1 = L14_1 - 1
          L17_1 = L17_1 % L10_1
          L17_1 = L17_1 + 1
          L15_1 = L15_1(L16_1, L17_1)
          L8_1 = L15_1
          L15_1 = mp
          L15_1 = L15_1.bitxor
          L16_1 = L7_1
          L17_1 = L8_1
          L15_1 = L15_1(L16_1, L17_1)
          L9_1 = L15_1
          L15_1 = L6_1
          L16_1 = string
          L16_1 = L16_1.char
          L17_1 = L9_1
          L16_1 = L16_1(L17_1)
          L6_1 = L15_1 .. L16_1
        end
        L11_1 = crypto
        L11_1 = L11_1.MD5Buffer
        L12_1 = L6_1
        L13_1 = 0
        L14_1 = #L6_1
        L11_1 = L11_1(L12_1, L13_1, L14_1)
        if L1_1 == L11_1 then
          L11_1 = MpCommon
          L11_1 = L11_1.Base64Encode
          L12_1 = L6_1
          L11_1 = L11_1(L12_1)
          L6_1 = L11_1
          L11_1 = mp
          L11_1 = L11_1.set_mpattribute
          L12_1 = string
          L12_1 = L12_1.format
          L13_1 = "MpInternal_researchdata=KazuarConfigData=%s"
          L14_1 = L6_1
          L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L12_1(L13_1, L14_1)
          L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
          L11_1 = mp
          L11_1 = L11_1.INFECTED
          return L11_1
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
