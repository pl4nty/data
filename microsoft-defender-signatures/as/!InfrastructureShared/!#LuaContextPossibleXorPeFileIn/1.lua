local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "HSTR:EmbeddedXorPeFileInResource.A"
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Exception:PossibleXorPeFileInResource"
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpNewlyCreatedHint"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "MpInternal_IsPliScan"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "MpIsSENSEScan"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "CMN:HSTR:InstallerFile"
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Exception:FileResourceAttributes"
  L0_1 = L0_1(L1_1)
  if L0_1 ~= true then
    goto lbl_55
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_55::
L0_1 = false
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "HSTR:EmbeddedXorPeFile.A"
L1_1 = L1_1(L2_1)
if L1_1 == true then
  L0_1 = true
end

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil then
    return
  end
  L1_2 = 1
  L2_2 = pehdr
  L2_2 = L2_2.NumberOfSections
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = tostring
    L6_2 = pesecs
    L6_2 = L6_2[L4_2]
    L6_2 = L6_2.Name
    L5_2 = L5_2(L6_2)
    if L5_2 == A0_2 then
      L5_2 = pesecs
      L5_2 = L5_2[L4_2]
      L5_2 = L5_2.PointerToRawData
      L6_2 = pesecs
      L6_2 = L6_2[L4_2]
      L6_2 = L6_2.SizeOfRawData
      return L5_2, L6_2
    end
  end
end

L2_1 = pehdr
if L2_1 ~= nil then
  L2_1 = pehdr
  L2_1 = L2_1.ImageBase
  if L2_1 ~= nil then
    goto lbl_74
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_74::
L2_1 = L1_1
L3_1 = ".rsrc"
L2_1, L3_1 = L2_1(L3_1)
if L2_1 == nil or L3_1 == nil or L3_1 < 5376 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  if A0_2 == nil then
    L2_2 = nil
    return L2_2
  end
  L2_2 = 0
  if A1_2 ~= nil and A1_2 == true then
    L2_2 = 255
  end
  L3_2 = 0
  L4_2 = L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = string
    L7_2 = L7_2.char
    L8_2 = mp
    L8_2 = L8_2.bitxor
    L9_2 = 105
    L10_2 = L6_2
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L8_2(L9_2, L10_2)
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L8_2 = string
    L8_2 = L8_2.char
    L9_2 = mp
    L9_2 = L9_2.bitxor
    L10_2 = 110
    L11_2 = L6_2
    L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L9_2(L10_2, L11_2)
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L9_2 = string
    L9_2 = L9_2.char
    L10_2 = mp
    L10_2 = L10_2.bitxor
    L11_2 = 32
    L12_2 = L6_2
    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L10_2(L11_2, L12_2)
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L10_2 = string
    L10_2 = L10_2.char
    L11_2 = mp
    L11_2 = L11_2.bitxor
    L12_2 = 68
    L13_2 = L6_2
    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L11_2(L12_2, L13_2)
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L11_2 = string
    L11_2 = L11_2.char
    L12_2 = mp
    L12_2 = L12_2.bitxor
    L13_2 = 79
    L14_2 = L6_2
    L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L12_2(L13_2, L14_2)
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L12_2 = string
    L12_2 = L12_2.char
    L13_2 = mp
    L13_2 = L13_2.bitxor
    L14_2 = 83
    L15_2 = L6_2
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L13_2(L14_2, L15_2)
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L13_2 = string
    L13_2 = L13_2.char
    L14_2 = mp
    L14_2 = L14_2.bitxor
    L15_2 = 32
    L16_2 = L6_2
    L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L14_2(L15_2, L16_2)
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L14_2 = string
    L14_2 = L14_2.char
    L15_2 = mp
    L15_2 = L15_2.bitxor
    L16_2 = 109
    L17_2 = L6_2
    L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L15_2(L16_2, L17_2)
    L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L15_2 = string
    L15_2 = L15_2.char
    L16_2 = mp
    L16_2 = L16_2.bitxor
    L17_2 = 111
    L18_2 = L6_2
    L16_2, L17_2, L18_2, L19_2, L20_2 = L16_2(L17_2, L18_2)
    L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
    L16_2 = string
    L16_2 = L16_2.char
    L17_2 = mp
    L17_2 = L17_2.bitxor
    L18_2 = 100
    L19_2 = L6_2
    L17_2, L18_2, L19_2, L20_2 = L17_2(L18_2, L19_2)
    L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
    L17_2 = string
    L17_2 = L17_2.char
    L18_2 = mp
    L18_2 = L18_2.bitxor
    L19_2 = 101
    L20_2 = L6_2
    L18_2, L19_2, L20_2 = L18_2(L19_2, L20_2)
    L17_2 = L17_2(L18_2, L19_2, L20_2)
    L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2
    L8_2 = string
    L8_2 = L8_2.find
    L9_2 = A0_2
    L10_2 = L7_2
    L11_2 = 1
    L12_2 = true
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    if L8_2 ~= nil then
      L9_2 = string
      L9_2 = L9_2.char
      L10_2 = mp
      L10_2 = L10_2.bitxor
      L11_2 = 80
      L12_2 = L6_2
      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L10_2(L11_2, L12_2)
      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      L10_2 = string
      L10_2 = L10_2.char
      L11_2 = mp
      L11_2 = L11_2.bitxor
      L12_2 = 69
      L13_2 = L6_2
      L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L11_2(L12_2, L13_2)
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      L9_2 = L9_2 .. L10_2
      L10_2 = string
      L10_2 = L10_2.find
      L11_2 = A0_2
      L12_2 = L9_2
      L13_2 = L8_2
      L14_2 = true
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      if L10_2 ~= nil then
        L11_2 = string
        L11_2 = L11_2.char
        L12_2 = mp
        L12_2 = L12_2.bitxor
        L13_2 = 77
        L14_2 = L6_2
        L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L12_2(L13_2, L14_2)
        L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        L12_2 = string
        L12_2 = L12_2.char
        L13_2 = mp
        L13_2 = L13_2.bitxor
        L14_2 = 90
        L15_2 = L6_2
        L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L13_2(L14_2, L15_2)
        L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        L11_2 = L11_2 .. L12_2
        L12_2 = string
        L12_2 = L12_2.find
        L13_2 = A0_2
        L14_2 = L11_2
        L15_2 = 1
        L16_2 = true
        L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
        if L12_2 ~= nil and L8_2 > L12_2 then
          L13_2 = L6_2
          L14_2 = L12_2
          return L13_2, L14_2
        end
      end
    end
  end
  L3_2 = nil
  return L3_2
end

L5_1 = mp
L5_1 = L5_1.readprotection
L6_1 = false
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = L2_1
L7_1 = 1280
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = L4_1
L7_1 = L5_1
L8_1 = L0_1
L6_1 = L6_1(L7_1, L8_1)
if L6_1 == nil then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
if L6_1 == 0 then
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "Lua:Context/PeFileInResource.A"
  L7_1(L8_1)
elseif 1 <= L6_1 and L6_1 <= 255 then
  L7_1 = string
  L7_1 = L7_1.format
  L8_1 = "0x%x"
  L9_1 = L6_1
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "Lua:Context/PossibleXorPeFileInResource.A!"
  L10_1 = tostring
  L11_1 = L7_1
  L10_1 = L10_1(L11_1)
  L9_1 = L9_1 .. L10_1
  L8_1(L9_1)
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
