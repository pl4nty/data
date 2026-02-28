local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if not L0_1 or 7000 < L0_1 and L0_1 < 16000 or 22000 < L0_1 and L0_1 < 1300000 or 1600000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = nil
if 7000 < L0_1 and L0_1 < 22000 then
  L2_1 = tostring
  L3_1 = mp
  L3_1 = L3_1.readfile
  L4_1 = 0
  L5_1 = 7000
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L3_1(L4_1, L5_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
  L1_1 = L2_1
elseif 1300000 < L0_1 and L0_1 < 1600000 then
  L2_1 = tostring
  L3_1 = mp
  L3_1 = L3_1.readfile
  L4_1 = 0
  L5_1 = 20000
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L3_1(L4_1, L5_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
  L1_1 = L2_1
else
  L2_1 = tostring
  L3_1 = mp
  L3_1 = L3_1.readfile
  L4_1 = 0
  L5_1 = L0_1
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L3_1(L4_1, L5_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
  L1_1 = L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "\208\207\017\224\161\177\026\225"
L5_1 = 1
L6_1 = true
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 or not L3_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L1_1
  L6_1 = "[Ee][Qq][Uu][Aa][Tt][Ii][Oo][Nn].3"
  L4_1, L5_1 = L4_1(L5_1, L6_1)
  L3_1 = L5_1
  L2_1 = L4_1
  if not L2_1 or not L3_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L4_1 = L2_1
L5_1 = {}
L5_1[184] = 5
L5_1[187] = 5
L5_1[185] = 5
L5_1[186] = 5
L5_1[190] = 5
L5_1[191] = 5
L5_1[188] = 5
L5_1[189] = 5
L5_1[203] = 1
L6_1 = {}
L6_1[129] = 6
L6_1[27] = 6
L6_1[247] = 2
L6_1[46] = 5
L6_1[45] = 5
L6_1[53] = 5
L6_1[5] = 5
L6_1[37] = 5
L7_1 = {}
L7_1[139] = 2
L8_1 = mp
L8_1 = L8_1.get_mpattribute
L9_1 = "SCRIPT:OLE.EquationCLSID"
L8_1 = L8_1(L9_1)
if L8_1 then
  L8_1 = L4_1 + 2048
  L2_1 = L8_1 + 14
else
  L8_1 = mp
  L8_1 = L8_1.get_mpattribute
  L9_1 = "SCPT:OLE.Equation3.A"
  L8_1 = L8_1(L9_1)
  if L8_1 then
    L2_1 = L4_1 + 33
  else
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
end

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = {}
  L3_2 = 38
  L4_2 = 78
  L5_2 = 102
  L6_2 = 230
  L7_2 = 270
  L8_2 = 11305
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = A0_2 + 2048
    L8_2 = L8_2 + L7_2
    L2_1 = L8_2
    L8_2 = L2_1
    L9_2 = L0_1
    if L8_2 < L9_2 then
      L8_2 = L5_1
      L10_2 = A1_2
      L9_2 = A1_2.byte
      L11_2 = L2_1
      L9_2 = L9_2(L10_2, L11_2)
      L8_2 = L8_2[L9_2]
      if L8_2 then
        L8_2 = L2_1
        return L8_2
      end
    end
  end
  L3_2 = nil
  return L3_2
end

if L0_1 > L2_1 then
  L10_1 = L1_1
  L9_1 = L1_1.byte
  L11_1 = L2_1
  L9_1 = L9_1(L10_1, L11_1)
  L9_1 = L5_1[L9_1]
  if L9_1 then
    goto lbl_147
  end
end
L9_1 = L8_1
L10_1 = L4_1
L11_1 = L1_1
L9_1 = L9_1(L10_1, L11_1)
L2_1 = L9_1
if not L2_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
::lbl_147::
L10_1 = L1_1
L9_1 = L1_1.byte
L11_1 = L2_1
L9_1 = L9_1(L10_1, L11_1)
L9_1 = L5_1[L9_1]
if not L9_1 then
  L9_1 = 0
end
L2_1 = L2_1 + L9_1
if L0_1 > L2_1 then
  L10_1 = L1_1
  L9_1 = L1_1.byte
  L11_1 = L2_1
  L9_1 = L9_1(L10_1, L11_1)
  L9_1 = L6_1[L9_1]
  if L9_1 then
    goto lbl_179
  end
end
L9_1 = L8_1
L10_1 = L4_1
L11_1 = L1_1
L9_1 = L9_1(L10_1, L11_1)
L2_1 = L9_1
if L2_1 then
  L10_1 = L1_1
  L9_1 = L1_1.byte
  L11_1 = L2_1
  L9_1 = L9_1(L10_1, L11_1)
  L9_1 = L6_1[L9_1]
  if L9_1 then
    goto lbl_179
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_179::
L10_1 = L1_1
L9_1 = L1_1.byte
L11_1 = L2_1
L9_1 = L9_1(L10_1, L11_1)
L9_1 = L6_1[L9_1]
if not L9_1 then
  L9_1 = 0
end
L2_1 = L2_1 + L9_1
if L0_1 > L2_1 then
  L10_1 = L1_1
  L9_1 = L1_1.byte
  L11_1 = L2_1
  L9_1 = L9_1(L10_1, L11_1)
  L9_1 = L7_1[L9_1]
  if L9_1 then
    goto lbl_198
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_198::
L9_1 = L2_1 + 3
if L0_1 > L9_1 then
  L10_1 = L1_1
  L9_1 = L1_1.byte
  L11_1 = L2_1 + 2
  L9_1 = L9_1(L10_1, L11_1)
  L9_1 = L7_1[L9_1]
  if L9_1 then
    goto lbl_216
  end
  L10_1 = L1_1
  L9_1 = L1_1.byte
  L11_1 = L2_1 + 3
  L9_1 = L9_1(L10_1, L11_1)
  L9_1 = L7_1[L9_1]
  if L9_1 then
    goto lbl_216
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_216::
L9_1 = mp
L9_1 = L9_1.getfilename
L9_1 = L9_1()
if L9_1 then
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L9_1
  L12_1 = "->(Rtf"
  L13_1 = 1
  L14_1 = true
  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  if L10_1 == nil then
    L10_1 = string
    L10_1 = L10_1.find
    L11_1 = L9_1
    L12_1 = "->xl/embeddings/oleObject"
    L13_1 = 1
    L14_1 = true
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    if L10_1 == nil then
      goto lbl_243
    end
  end
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = "Lua:OLE.ShellcodeInSuspiciousFile"
  L10_1(L11_1)
end
::lbl_243::
L10_1 = mp
L10_1 = L10_1.INFECTED
return L10_1
