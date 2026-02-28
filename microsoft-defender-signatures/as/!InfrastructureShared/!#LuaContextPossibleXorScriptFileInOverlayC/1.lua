local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Exception:PossibleXorScriptFileInOverlay"
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:Context/PossibleXorEmbeddedFileInOverlay"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    goto lbl_16
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_16::
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "CMN:HSTR:InstallerFile"
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.ispackedwith
  L1_1 = "AutoIt+"
  L0_1 = L0_1(L1_1)
  if L0_1 ~= true then
    L0_1 = mp
    L0_1 = L0_1.get_mpattributesubstring
    L1_1 = "Win32/AutoIt"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattributesubstring
      L1_1 = "PESTATIC:cleanstub_autoitv"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        L0_1 = mp
        L0_1 = L0_1.get_mpattribute
        L1_1 = "Exception:FileOverlayAttributes"
        L0_1 = L0_1(L1_1)
        if L0_1 ~= true then
          goto lbl_49
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_49::
L0_1 = pehdr
if L0_1 ~= nil then
  L0_1 = pehdr
  L0_1 = L0_1.ImageBase
  if L0_1 ~= nil then
    goto lbl_59
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_59::
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.PointerToRawData
L1_1 = pesecs
L2_1 = pehdr
L2_1 = L2_1.NumberOfSections
L1_1 = L1_1[L2_1]
L1_1 = L1_1.SizeOfRawData
L0_1 = L0_1 + L1_1
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L0_1 == nil or L1_1 == nil or L0_1 >= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1 - L0_1
if L2_1 < 2560 or 10485760 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A0_2 == nil then
    L1_2 = nil
    return L1_2
  end
  L1_2 = 0
  L2_2 = 255
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = string
    L5_2 = L5_2.char
    L6_2 = mp
    L6_2 = L6_2.bitxor
    L7_2 = 102
    L8_2 = L4_2
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L6_2(L7_2, L8_2)
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = string
    L6_2 = L6_2.char
    L7_2 = mp
    L7_2 = L7_2.bitxor
    L8_2 = 111
    L9_2 = L4_2
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L7_2(L8_2, L9_2)
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L7_2 = string
    L7_2 = L7_2.char
    L8_2 = mp
    L8_2 = L8_2.bitxor
    L9_2 = 114
    L10_2 = L4_2
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L8_2(L9_2, L10_2)
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L8_2 = string
    L8_2 = L8_2.char
    L9_2 = mp
    L9_2 = L9_2.bitxor
    L10_2 = 101
    L11_2 = L4_2
    L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L9_2(L10_2, L11_2)
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L9_2 = string
    L9_2 = L9_2.char
    L10_2 = mp
    L10_2 = L10_2.bitxor
    L11_2 = 97
    L12_2 = L4_2
    L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2, L12_2)
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L10_2 = string
    L10_2 = L10_2.char
    L11_2 = mp
    L11_2 = L11_2.bitxor
    L12_2 = 99
    L13_2 = L4_2
    L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2, L13_2)
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
    L11_2 = string
    L11_2 = L11_2.char
    L12_2 = mp
    L12_2 = L12_2.bitxor
    L13_2 = 104
    L14_2 = L4_2
    L12_2, L13_2, L14_2 = L12_2(L13_2, L14_2)
    L11_2 = L11_2(L12_2, L13_2, L14_2)
    L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = A0_2
    L8_2 = L5_2
    L9_2 = 1
    L10_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    if L6_2 ~= nil then
      L7_2 = L4_2
      L8_2 = L6_2
      return L7_2, L8_2
    end
  end
  L1_2 = nil
  return L1_2
end

L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = L0_1
L6_1 = 1280
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L3_1
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
if L5_1 == 0 then
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "Lua:Context/ScriptFileInOverlay.C"
  L6_1(L7_1)
elseif 1 <= L5_1 and L5_1 <= 255 then
  L6_1 = string
  L6_1 = L6_1.format
  L7_1 = "0x%x"
  L8_1 = L5_1
  L6_1 = L6_1(L7_1, L8_1)
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "Lua:Context/PossibleXorScriptFileInOverlay.C!"
  L9_1 = tostring
  L10_1 = L6_1
  L9_1 = L9_1(L10_1)
  L8_1 = L8_1 .. L9_1
  L7_1(L8_1)
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "Lua:Context/PossibleXorEmbeddedFileInOverlay"
  L7_1(L8_1)
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
