local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if not (L0_1 < 128) then
  L0_1 = mp
  L0_1 = L0_1.FOOTERPAGE_SZ
  if not (L0_1 < 22) then
    goto lbl_12
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_12::
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 67324752 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 16777216 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.FOOTERPAGE_SZ
L1_1 = L1_1 - 21
L2_1 = mp
L2_1 = L2_1.readu_u32
L3_1 = footerpage
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= 101010256 then
  L2_1 = 276
  L3_1 = mp
  L3_1 = L3_1.readfile
  L4_1 = L0_1 - L2_1
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "PK\005\006"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  L1_1 = L4_1
  if L1_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.FOOTERPAGE_SZ
  L4_1 = L1_1 + L4_1
  L1_1 = L4_1 - L2_1
end
L2_1 = mp
L2_1 = L2_1.readu_u16
L3_1 = footerpage
L4_1 = L1_1 + 10
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = footerpage
L5_1 = L1_1 + 12
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.readu_u32
L5_1 = footerpage
L6_1 = L1_1 + 16
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = L4_1
L7_1 = L3_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = 700
L7_1 = 0
L8_1 = 0
L9_1 = 0
L10_1 = 0
L11_1 = 0
L12_1 = 0
L13_1 = false
L14_1 = false
L15_1 = false
L16_1 = {}
L17_1 = 0
L18_1 = 1
L19_1 = mp
L19_1 = L19_1.readu_u32
L20_1 = L5_1
L21_1 = L18_1
L19_1 = L19_1(L20_1, L21_1)
if L19_1 ~= 33639248 then
  L19_1 = mp
  L19_1 = L19_1.CLEAN
  return L19_1
end
while L18_1 ~= nil do
  L7_1 = L7_1 + 1
  L19_1 = mp
  L19_1 = L19_1.readu_u16
  L20_1 = L5_1
  L21_1 = L18_1 + 28
  L19_1 = L19_1(L20_1, L21_1)
  L20_1 = string
  L20_1 = L20_1.sub
  L21_1 = L5_1
  L22_1 = L18_1 + 46
  L23_1 = L18_1 + 46
  L23_1 = L23_1 + L19_1
  L23_1 = L23_1 - 1
  L20_1 = L20_1(L21_1, L22_1, L23_1)
  L21_1 = mp
  L21_1 = L21_1.readu_u32
  L22_1 = L5_1
  L23_1 = L18_1 + 24
  L21_1 = L21_1(L22_1, L23_1)
  L22_1 = mp
  L22_1 = L22_1.readu_u16
  L23_1 = L5_1
  L24_1 = L18_1 + 12
  L22_1 = L22_1(L23_1, L24_1)
  L23_1 = mp
  L23_1 = L23_1.readu_u16
  L24_1 = L5_1
  L25_1 = L18_1 + 14
  L23_1 = L23_1(L24_1, L25_1)
  if 6 <= L19_1 and L20_1 ~= nil then
    L24_1 = string
    L24_1 = L24_1.lower
    L25_1 = string
    L25_1 = L25_1.sub
    L26_1 = L20_1
    L27_1 = -6
    L25_1, L26_1, L27_1, L28_1, L29_1 = L25_1(L26_1, L27_1)
    L24_1 = L24_1(L25_1, L26_1, L27_1, L28_1, L29_1)
    if L24_1 == ".class" then
      L8_1 = L8_1 + 1
    else
      L25_1 = string
      L25_1 = L25_1.find
      L26_1 = L24_1
      L27_1 = ".b64"
      L28_1 = 3
      L29_1 = true
      L25_1 = L25_1(L26_1, L27_1, L28_1, L29_1)
      if L25_1 == 3 then
        L9_1 = L9_1 + 1
      else
        L25_1 = string
        L25_1 = L25_1.find
        L26_1 = L20_1
        L27_1 = "com/"
        L28_1 = 1
        L29_1 = true
        L25_1 = L25_1(L26_1, L27_1, L28_1, L29_1)
        if L25_1 ~= 1 then
          L25_1 = string
          L25_1 = L25_1.find
          L26_1 = L20_1
          L27_1 = "net/"
          L28_1 = 1
          L29_1 = true
          L25_1 = L25_1(L26_1, L27_1, L28_1, L29_1)
          if L25_1 ~= 1 then
            goto lbl_213
          end
        end
        L25_1 = string
        L25_1 = L25_1.find
        L26_1 = L20_1
        L27_1 = "."
        L28_1 = 1
        L29_1 = true
        L25_1 = L25_1(L26_1, L27_1, L28_1, L29_1)
        if L25_1 == nil then
          L25_1 = string
          L25_1 = L25_1.sub
          L26_1 = L20_1
          L27_1 = -1
          L25_1 = L25_1(L26_1, L27_1)
          if L25_1 ~= "/" then
            L10_1 = L10_1 + 1
          end
        end
      end
    end
    ::lbl_213::
    if L17_1 <= 100 then
      L25_1 = string
      L25_1 = L25_1.match
      L26_1 = L24_1
      L27_1 = "%.(.*)"
      L25_1 = L25_1(L26_1, L27_1)
      L24_1 = L25_1
      if L24_1 ~= nil and L24_1 ~= "class" and L24_1 ~= "b64" and L24_1 ~= "mf" then
        L25_1 = L16_1[L24_1]
        if L25_1 == nil then
          L16_1[L24_1] = true
          L17_1 = L17_1 + 1
        end
      end
    end
    if L15_1 == false then
      L25_1 = string
      L25_1 = L25_1.find
      L26_1 = L20_1
      L27_1 = "[0-9]"
      L25_1 = L25_1(L26_1, L27_1)
      if L25_1 ~= nil then
        L26_1 = string
        L26_1 = L26_1.sub
        L27_1 = L20_1
        L28_1 = L25_1 - 1
        L29_1 = L25_1 - 1
        L26_1 = L26_1(L27_1, L28_1, L29_1)
        if L26_1 ~= "$" then
          L15_1 = true
        end
      end
    end
    L25_1 = string
    L25_1 = L25_1.find
    L26_1 = L20_1
    L27_1 = "META-INF/"
    L28_1 = 1
    L29_1 = true
    L25_1 = L25_1(L26_1, L27_1, L28_1, L29_1)
    if L25_1 == 1 and L20_1 ~= "META-INF/MANIFEST.MF" then
      L12_1 = L12_1 + 1
    end
  end
  L24_1 = L18_1 + 46
  L24_1 = L24_1 + L19_1
  if L20_1 == "META-INF/MANIFEST.MF" then
    L25_1 = MpCommon
    L25_1 = L25_1.DosTimeToFileTime
    L26_1 = L22_1
    L27_1 = L23_1
    L25_1 = L25_1(L26_1, L27_1)
    L26_1 = MpCommon
    L26_1 = L26_1.TimeTToFileTime
    L27_1 = MpCommon
    L27_1 = L27_1.GetCurrentTimeT
    L27_1, L28_1, L29_1 = L27_1()
    L26_1 = L26_1(L27_1, L28_1, L29_1)
    if L25_1 ~= 0 and L25_1 < L26_1 then
      L27_1 = 864000000000
      L28_1 = L26_1 - L25_1
      L29_1 = 15 * L27_1
      L13_1 = L28_1 <= L29_1
    end
    L27_1 = mp
    L27_1 = L27_1.readu_u32
    L28_1 = L5_1
    L29_1 = L24_1
    L27_1 = L27_1(L28_1, L29_1)
    if L27_1 == 51966 then
      L24_1 = L24_1 + 4
    end
    if L21_1 <= 150 then
      L14_1 = true
    end
    L11_1 = L11_1 + 1
  end
  L18_1 = nil
  if L3_1 > L24_1 then
    L25_1 = mp
    L25_1 = L25_1.readu_u32
    L26_1 = L5_1
    L27_1 = L24_1
    L25_1 = L25_1(L26_1, L27_1)
    if L25_1 == 33639248 then
      L18_1 = L24_1
    end
  end
  if L6_1 < L7_1 then
    break
  end
end
if L14_1 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:JarManifestSizeLT150"
  L19_1(L20_1)
end
if L15_1 == false then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:JarNoNumberInFilenames"
  L19_1(L20_1)
end
if 1 <= L10_1 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:JarNoExtFiles"
  L19_1(L20_1)
  if 10 <= L10_1 then
    L19_1 = mp
    L19_1 = L19_1.set_mpattribute
    L20_1 = "//Lua:JarNoExtFilesGE10"
    L19_1(L20_1)
  end
  if 25 <= L10_1 then
    L19_1 = mp
    L19_1 = L19_1.set_mpattribute
    L20_1 = "//Lua:JarNoExtFilesGE25"
    L19_1(L20_1)
  end
  if 50 <= L10_1 then
    L19_1 = mp
    L19_1 = L19_1.set_mpattribute
    L20_1 = "//Lua:JarNoExtFilesGE50"
    L19_1(L20_1)
  end
  if 100 <= L10_1 then
    L19_1 = mp
    L19_1 = L19_1.set_mpattribute
    L20_1 = "//Lua:JarNoExtFilesGE100"
    L19_1(L20_1)
  end
end
if 10 <= L17_1 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:JarDifferentExtsInsideGE10"
  L19_1(L20_1)
  if 25 <= L17_1 then
    L19_1 = mp
    L19_1 = L19_1.set_mpattribute
    L20_1 = "//Lua:JarDifferentExtsInsideGE25"
    L19_1(L20_1)
  end
  if 50 <= L17_1 then
    L19_1 = mp
    L19_1 = L19_1.set_mpattribute
    L20_1 = "//Lua:JarDifferentExtsInsideGE50"
    L19_1(L20_1)
  end
  if 100 <= L17_1 then
    L19_1 = mp
    L19_1 = L19_1.set_mpattribute
    L20_1 = "//Lua:JarDifferentExtsInsideGE100"
    L19_1(L20_1)
  end
end
if L8_1 == 0 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:JarNoClassFilesInside"
  L19_1(L20_1)
elseif L8_1 == 1 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:JarSingleClassFileInside"
  L19_1(L20_1)
elseif 5 <= L8_1 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:JarClassFilesInsideGE5"
  L19_1(L20_1)
  if 10 <= L8_1 then
    L19_1 = mp
    L19_1 = L19_1.set_mpattribute
    L20_1 = "//Lua:JarClassFilesInsideGE10"
    L19_1(L20_1)
  end
  if 25 <= L8_1 then
    L19_1 = mp
    L19_1 = L19_1.set_mpattribute
    L20_1 = "//Lua:JarClassFilesInsideGE25"
    L19_1(L20_1)
  end
  if 50 <= L8_1 then
    L19_1 = mp
    L19_1 = L19_1.set_mpattribute
    L20_1 = "//Lua:JarClassFilesInsideGE50"
    L19_1(L20_1)
  end
  if 100 <= L8_1 then
    L19_1 = mp
    L19_1 = L19_1.set_mpattribute
    L20_1 = "//Lua:JarClassFilesInsideGE100"
    L19_1(L20_1)
  end
end
if 1 <= L12_1 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:JarMoreFilesInMetaInf"
  L19_1(L20_1)
end
L19_1 = L2_1 - L11_1
L19_1 = L19_1 - L8_1
if L19_1 == L17_1 and 10 <= L17_1 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:JarDifferentExtsAllFiles"
  L19_1(L20_1)
end
if 15 <= L8_1 and 50 <= L10_1 and L11_1 == 1 and L9_1 == 0 and L13_1 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:Java.SuspiciousCrypter.Loose.A"
  L19_1(L20_1)
end
if 400 <= L10_1 and L11_1 == 1 and L9_1 == 0 and L13_1 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:Java.SuspiciousCrypter.Loose.B"
  L19_1(L20_1)
end
if 10 <= L8_1 and 10 <= L10_1 and L11_1 == 1 and L13_1 and L14_1 and L15_1 == false then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:Java.SuspiciousCrypter.Loose.C"
  L19_1(L20_1)
end
if 25 <= L8_1 and L8_1 <= 55 and 100 <= L10_1 and L10_1 <= 150 and L11_1 == 1 and L13_1 and 450000 <= L0_1 and L0_1 <= 700000 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:Java.SuspiciousCrypter.JRAT"
  L19_1(L20_1)
elseif 200 <= L8_1 and L8_1 <= 250 and 300 <= L10_1 and L10_1 <= 500 and L11_1 == 1 and L13_1 and 580000 <= L0_1 and L0_1 <= 720000 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:Java.SuspiciousCrypter.JRAT.B"
  L19_1(L20_1)
elseif 200 <= L8_1 and L8_1 <= 250 and 40 <= L10_1 and L10_1 <= 100 and L11_1 == 1 and L13_1 and 100000 <= L0_1 and L0_1 <= 170000 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:Java.SuspiciousCrypter.JRAT.C"
  L19_1(L20_1)
elseif 25 <= L8_1 and L8_1 <= 40 and (450 <= L10_1 and L10_1 <= 550 or 180 <= L10_1 and L10_1 <= 250) and L11_1 == 1 and L13_1 and 580000 <= L0_1 and L0_1 <= 720000 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:Java.SuspiciousCrypter.JRAT.D"
  L19_1(L20_1)
elseif 100 <= L8_1 and L8_1 <= 300 and (100 <= L10_1 and L10_1 <= 200 or 400 <= L10_1 and L10_1 <= 600 or 1500 <= L10_1 and L10_1 <= 2000) and L11_1 == 1 and L13_1 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:Java.SuspiciousCrypter.JRAT.E"
  L19_1(L20_1)
elseif 15 <= L8_1 and L8_1 <= 50 and 120 <= L10_1 and L10_1 <= 280 and L11_1 == 1 and L13_1 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:Java.SuspiciousCrypter.JRAT.F"
  L19_1(L20_1)
elseif L8_1 == 0 and L10_1 == 700 and L11_1 == 1 and L13_1 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:Java.SuspiciousCrypter.JRAT.G"
  L19_1(L20_1)
elseif 40 <= L8_1 and L8_1 <= 70 and 300 <= L10_1 and L10_1 <= 500 and L11_1 == 1 and L13_1 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:Java.SuspiciousCrypter.JRAT.H"
  L19_1(L20_1)
elseif L8_1 == 1 and L10_1 == 0 and L11_1 == 1 and L13_1 and 90 <= L17_1 and 100000 <= L0_1 and L0_1 <= 700000 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:Java.SuspiciousCrypter.JRAT.J"
  L19_1(L20_1)
elseif 20 <= L8_1 and L8_1 <= 55 and 150 <= L10_1 and L10_1 <= 250 and L11_1 == 1 and L13_1 and 200000 <= L0_1 and L0_1 <= 320000 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:Java.SuspiciousCrypter.QRAT"
  L19_1(L20_1)
elseif 26 <= L8_1 and L8_1 <= 40 and 9 <= L10_1 and L10_1 <= 18 and L11_1 == 1 and L13_1 and 48000 <= L0_1 and L0_1 <= 62000 and 15 <= L9_1 and L9_1 <= 17 then
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "//Lua:Java.SuspiciousCrypter.QRAT.B"
  L19_1(L20_1)
end
L19_1 = mp
L19_1 = L19_1.CLEAN
return L19_1
