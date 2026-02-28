local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:LNK_Settings!RunMinimized"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:FileOnIsoRoot"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.GetLnkInfo
L0_1, L1_1 = L0_1(L1_1)
if L0_1 == false or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.Arguments
if not L2_1 then
  L2_1 = nil
end
L3_1 = L1_1.BasePath
if not L3_1 then
  L3_1 = nil
end
L4_1 = L1_1.RelativePath
if not L4_1 then
  L4_1 = nil
end
L5_1 = L1_1.IconLocation
if not L5_1 then
  L5_1 = nil
end
L6_1 = L1_1.IconIndex
if not L6_1 then
  L6_1 = nil
end
L7_1 = 0
if L5_1 ~= nil then
  L9_1 = L5_1
  L8_1 = L5_1.byte
  L8_1 = L8_1(L9_1)
  if L8_1 < 65 or 122 < L8_1 then
    L9_1 = {}
    L10_1 = string
    L10_1 = L10_1.byte
    L11_1 = L5_1
    L12_1 = 1
    L13_1 = #L5_1
    L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L10_1(L11_1, L12_1, L13_1)
    L9_1[1] = L10_1
    L9_1[2] = L11_1
    L9_1[3] = L12_1
    L9_1[4] = L13_1
    L9_1[5] = L14_1
    L9_1[6] = L15_1
    L9_1[7] = L16_1
    L9_1[8] = L17_1
    L9_1[9] = L18_1
    L10_1 = 1
    L11_1 = #L9_1
    L12_1 = 1
    for L13_1 = L10_1, L11_1, L12_1 do
      L14_1 = L9_1[L13_1]
      if 65 <= L14_1 then
        L14_1 = L9_1[L13_1]
        if L14_1 <= 122 then
          L7_1 = L13_1
          break
        end
      end
    end
  end
  if 1 <= L7_1 then
    L9_1 = mp
    L9_1 = L9_1.set_mpattribute
    L10_1 = "NotReadableCharsInIcnLoc"
    L9_1(L10_1)
  end
  L10_1 = L5_1
  L9_1 = L5_1.match
  L11_1 = "\\([^\\]+)$"
  L9_1 = L9_1(L10_1, L11_1)
  L10_1 = L9_1
  L9_1 = L9_1.lower
  L9_1 = L9_1(L10_1)
  L5_1 = L9_1
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "//HasIconLocation!"
  L11_1 = L5_1
  L10_1 = L10_1 .. L11_1
  L9_1(L10_1)
end
if L6_1 ~= nil then
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "//HasIconIndex!"
  L10_1 = L6_1
  L9_1 = L9_1 .. L10_1
  L8_1(L9_1)
end
L8_1 = {}
L9_1 = "odbcconf"
L10_1 = "rundll32"
L11_1 = "regsvr"
L12_1 = "powershell"
L13_1 = "calc"
L14_1 = "wscript"
L15_1 = "cscript"
L16_1 = "mshta"
L8_1[1] = L9_1
L8_1[2] = L10_1
L8_1[3] = L11_1
L8_1[4] = L12_1
L8_1[5] = L13_1
L8_1[6] = L14_1
L8_1[7] = L15_1
L8_1[8] = L16_1
L9_1 = false
if L4_1 ~= nil then
  L11_1 = L4_1
  L10_1 = L4_1.lower
  L10_1 = L10_1(L11_1)
  L4_1 = L10_1
  L10_1 = StringEndsWith
  L11_1 = L4_1
  L12_1 = ".js"
  L10_1 = L10_1(L11_1, L12_1)
  if not L10_1 then
    L10_1 = StringEndsWith
    L11_1 = L4_1
    L12_1 = ".cmd"
    L10_1 = L10_1(L11_1, L12_1)
    if not L10_1 then
      L10_1 = StringEndsWith
      L11_1 = L4_1
      L12_1 = ".bat"
      L10_1 = L10_1(L11_1, L12_1)
      if not L10_1 then
        L10_1 = StringEndsWith
        L11_1 = L4_1
        L12_1 = ".vbs"
        L10_1 = L10_1(L11_1, L12_1)
        if not L10_1 then
          goto lbl_144
        end
      end
    end
  end
  L9_1 = true
end
::lbl_144::
if L9_1 == false and L2_1 ~= nil then
  L11_1 = L2_1
  L10_1 = L2_1.lower
  L10_1 = L10_1(L11_1)
  L2_1 = L10_1
  L10_1 = StringEndsWith
  L11_1 = L2_1
  L12_1 = ".js"
  L10_1 = L10_1(L11_1, L12_1)
  if not L10_1 then
    L10_1 = StringEndsWith
    L11_1 = L2_1
    L12_1 = ".cmd"
    L10_1 = L10_1(L11_1, L12_1)
    if not L10_1 then
      L10_1 = StringEndsWith
      L11_1 = L2_1
      L12_1 = ".bat"
      L10_1 = L10_1(L11_1, L12_1)
      if not L10_1 then
        L10_1 = StringEndsWith
        L11_1 = L2_1
        L12_1 = ".vbs"
        L10_1 = L10_1(L11_1, L12_1)
        if not L10_1 then
          L10_1 = contains
          L11_1 = L2_1
          L12_1 = L8_1
          L10_1 = L10_1(L11_1, L12_1)
          if not L10_1 then
            goto lbl_182
          end
        end
      end
    end
  end
  L9_1 = true
end
::lbl_182::
if L9_1 == false and L3_1 ~= nil then
  L11_1 = L3_1
  L10_1 = L3_1.lower
  L10_1 = L10_1(L11_1)
  L3_1 = L10_1
  L10_1 = contains
  L11_1 = L3_1
  L12_1 = L8_1
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 then
    L9_1 = true
  end
end
if L9_1 == true then
  L11_1 = L5_1
  L10_1 = L5_1.match
  L12_1 = "\\([^\\]+)$"
  L10_1 = L10_1(L11_1, L12_1)
  L11_1 = L10_1
  L10_1 = L10_1.lower
  L10_1 = L10_1(L11_1)
  L5_1 = L10_1
  L6_1 = L6_1 + 1
  L10_1 = {}
  L11_1 = {}
  L12_1 = "explorer.exe"
  L13_1 = "write.exe"
  L14_1 = "zipfldr.dll"
  L11_1[1] = L12_1
  L11_1[2] = L13_1
  L11_1[3] = L14_1
  L10_1[1] = L11_1
  L10_1[2] = "zipfldr.dll"
  L10_1[4] = "shell32.dll"
  L10_1[5] = "imageres.dll"
  L10_1[37] = "shell32.dll"
  L10_1[39] = "shell32.dll"
  L10_1[66] = "imageres.dll"
  L10_1[154] = "imageres.dll"
  L10_1[14] = "msedge.exe"
  L9_1 = false
  L7_1 = L7_1 - 1
  L11_1 = type
  L12_1 = L10_1[L6_1]
  L11_1 = L11_1(L12_1)
  if L11_1 ~= "table" then
    L11_1 = L10_1[L6_1]
    L12_1 = L11_1
    L11_1 = L11_1.sub
    L13_1 = 1
    L14_1 = L10_1[L6_1]
    L14_1 = #L14_1
    L14_1 = L14_1 - L7_1
    L11_1 = L11_1(L12_1, L13_1, L14_1)
    if L11_1 == L5_1 then
      L9_1 = true
  end
  else
    L11_1 = type
    L12_1 = L10_1[L6_1]
    L11_1 = L11_1(L12_1)
    if L11_1 == "table" then
      L11_1 = 1
      L12_1 = L10_1[L6_1]
      L12_1 = #L12_1
      L13_1 = 1
      for L14_1 = L11_1, L12_1, L13_1 do
        L15_1 = L10_1[L6_1]
        L15_1 = L15_1[L14_1]
        L16_1 = L15_1
        L15_1 = L15_1.sub
        L17_1 = 1
        L18_1 = L10_1[L6_1]
        L18_1 = L18_1[L14_1]
        L18_1 = #L18_1
        L18_1 = L18_1 - L7_1
        L15_1 = L15_1(L16_1, L17_1, L18_1)
        if L15_1 == L5_1 then
          L9_1 = true
          break
        end
      end
    end
  end
  if L9_1 == true then
    L11_1 = mp
    L11_1 = L11_1.INFECTED
    return L11_1
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
