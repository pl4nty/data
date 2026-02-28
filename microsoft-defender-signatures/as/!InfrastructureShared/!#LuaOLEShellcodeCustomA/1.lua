local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 7000 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = tostring
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 0
L4_1 = L0_1
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "[Ee]\000[Qq]\000[Uu]\000[Aa]\000[Tt]\000[Ii]\000[Oo]\000[Nn]\000\020\000[Nn]\000[Aa]\000[Tt]\000[Ii]\000[Vv]\000[Ee]"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "LUA:OLE.EquationNative"
  L2_1(L3_1)
  L2_1 = {}
  L2_1[184] = 5
  L2_1[187] = 5
  L2_1[185] = 5
  L2_1[186] = 5
  L2_1[190] = 5
  L2_1[191] = 5
  L2_1[188] = 5
  L2_1[189] = 5
  L3_1 = {}
  L3_1[129] = 6
  L3_1[247] = 2
  L3_1[46] = 5
  L3_1[45] = 5
  L3_1[53] = 5
  L3_1[5] = 5
  L3_1[37] = 5
  L4_1 = {}
  L4_1[139] = 2
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = "\208\207\017\224\161\177\026\225"
  L8_1 = 1
  L9_1 = true
  L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 == nil or L6_1 == nil then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = L5_1
  L8_1 = L7_1 + 512
  L5_1 = L8_1 + 38
  L9_1 = L1_1
  L8_1 = L1_1.byte
  L10_1 = L5_1
  L8_1 = L8_1(L9_1, L10_1)
  L8_1 = L2_1[L8_1]
  if L8_1 == nil then
    L8_1 = L7_1 + 512
    L5_1 = L8_1 + 38
    L9_1 = L1_1
    L8_1 = L1_1.byte
    L10_1 = L5_1
    L8_1 = L8_1(L9_1, L10_1)
    L8_1 = L2_1[L8_1]
    if L8_1 == nil then
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
  end
  L9_1 = L1_1
  L8_1 = L1_1.byte
  L10_1 = L5_1
  L8_1 = L8_1(L9_1, L10_1)
  L8_1 = L2_1[L8_1]
  L5_1 = L5_1 + L8_1
  L9_1 = L1_1
  L8_1 = L1_1.byte
  L10_1 = L5_1
  L8_1 = L8_1(L9_1, L10_1)
  L8_1 = L3_1[L8_1]
  if L8_1 == nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L9_1 = L1_1
  L8_1 = L1_1.byte
  L10_1 = L5_1
  L8_1 = L8_1(L9_1, L10_1)
  L8_1 = L3_1[L8_1]
  L5_1 = L5_1 + L8_1
  L9_1 = L1_1
  L8_1 = L1_1.byte
  L10_1 = L5_1
  L8_1 = L8_1(L9_1, L10_1)
  L8_1 = L4_1[L8_1]
  if L8_1 == nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L9_1 = L1_1
  L8_1 = L1_1.byte
  L10_1 = L5_1 + 2
  L8_1 = L8_1(L9_1, L10_1)
  L8_1 = L4_1[L8_1]
  if L8_1 == nil then
    L9_1 = L1_1
    L8_1 = L1_1.byte
    L10_1 = L5_1 + 3
    L8_1 = L8_1(L9_1, L10_1)
    L8_1 = L4_1[L8_1]
    if L8_1 == nil then
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
  end
  L8_1 = mp
  L8_1 = L8_1.getfilename
  L8_1 = L8_1()
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L8_1
  L11_1 = "->(Rtf"
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 == nil then
    L9_1 = string
    L9_1 = L9_1.find
    L10_1 = L8_1
    L11_1 = "->xl/embeddings/oleObject"
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if L9_1 == nil then
      goto lbl_152
    end
  end
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:OLE.ShellcodeInSuspiciousFile"
  L9_1(L10_1)
  ::lbl_152::
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
