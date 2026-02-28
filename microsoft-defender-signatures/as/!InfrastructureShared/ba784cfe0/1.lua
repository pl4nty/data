local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = {}
L0_1["P\000L\000U\000G\000I\000N\000S\000\000\000"] = "PLUGINS"
L0_1["P\000L\000U\000G\000I\000N\000S\0006\0004\000\000\000"] = "PLUGINS64"
L0_1["P\000N\000G\000\000\000"] = "PNG"
L0_1["A\000F\000X\000_\000D\000I\000A\000L\000O\000G\000_\000L\000A\000Y\000O\000U\000T\000\000\000"] = "AFX_DIALOG_LAYOUT"
L0_1["U\000P\000X\000\000\000"] = "UPX"
L0_1["Q\000Q\000W\000R\000Y\000\000\000"] = "QQWRY"
L1_1 = 0
L2_1 = pehdr
L2_1 = L2_1.DataDirectory
L3_1 = pe
L3_1 = L3_1.IMAGE_DIRECTORY_ENTRY_RESOURCE
L2_1 = L2_1[L3_1]
L2_1 = L2_1.RVA
L3_1 = pehdr
L3_1 = L3_1.DataDirectory
L4_1 = pe
L4_1 = L4_1.IMAGE_DIRECTORY_ENTRY_RESOURCE
L3_1 = L3_1[L4_1]
L3_1 = L3_1.Size
L4_1 = L2_1 + L3_1
if L2_1 == 0 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.getfilesize
L5_1 = L5_1()
if L5_1 < 20398080 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end

function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = tonumber
  L3_2 = A0_2
  L2_2 = A0_2.reverse
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2
  L2_2 = L2_2.gsub
  L4_2 = "."
  
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = string
    L1_3 = L1_3.format
    L2_3 = "%02x"
    L3_3 = string
    L3_3 = L3_3.byte
    L4_3 = A0_3
    L3_3, L4_3 = L3_3(L4_3)
    return L1_3(L2_3, L3_3, L4_3)
  end
  
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = 16
  return L1_2(L2_2, L3_2)
end

L6_1 = mp
L6_1 = L6_1.readprotection
L7_1 = false
L6_1(L7_1)
L6_1 = L5_1
L7_1 = mp
L7_1 = L7_1.readfile
L8_1 = pe
L8_1 = L8_1.foffset_rva
L9_1 = L2_1 + 12
L8_1 = L8_1(L9_1)
L9_1 = 2
L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L7_1(L8_1, L9_1)
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if L6_1 < 16 then
  L7_1 = L2_1 + 16
  while 0 < L6_1 do
    L8_1 = L5_1
    L9_1 = mp
    L9_1 = L9_1.readfile
    L10_1 = pe
    L10_1 = L10_1.foffset_rva
    L11_1 = L7_1
    L10_1 = L10_1(L11_1)
    L11_1 = 4
    L9_1, L10_1, L11_1, L12_1 = L9_1(L10_1, L11_1)
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    L9_1 = mp
    L9_1 = L9_1.bitand
    L10_1 = L8_1
    L11_1 = 2147483648
    L9_1 = L9_1(L10_1, L11_1)
    if L9_1 == 2147483648 then
      L9_1 = mp
      L9_1 = L9_1.bitand
      L10_1 = L8_1
      L11_1 = 2147483647
      L9_1 = L9_1(L10_1, L11_1)
      L8_1 = L2_1 + L9_1
      if L4_1 > L8_1 then
        L9_1 = L5_1
        L10_1 = mp
        L10_1 = L10_1.readfile
        L11_1 = pe
        L11_1 = L11_1.foffset_rva
        L12_1 = L8_1
        L11_1 = L11_1(L12_1)
        L12_1 = 2
        L10_1, L11_1, L12_1 = L10_1(L11_1, L12_1)
        L9_1 = L9_1(L10_1, L11_1, L12_1)
        if L9_1 < 20 then
          L10_1 = mp
          L10_1 = L10_1.readfile
          L11_1 = pe
          L11_1 = L11_1.foffset_rva
          L12_1 = L8_1 + 2
          L11_1 = L11_1(L12_1)
          L12_1 = L9_1 * 2
          L10_1 = L10_1(L11_1, L12_1)
          L11_1 = "\000\000"
          L10_1 = L10_1 .. L11_1
          L11_1 = L0_1[L10_1]
          if L11_1 ~= nil then
            L1_1 = L1_1 + 1
          end
        end
      end
    end
    L7_1 = L7_1 + 8
    L6_1 = L6_1 - 1
  end
end
L7_1 = mp
L7_1 = L7_1.readprotection
L8_1 = true
L7_1(L8_1)
if 5 <= L1_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
