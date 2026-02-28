local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "BRUTE:HackTool:Win32/Firepwd"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "KCRC:ackTool:Win32/Firepwd"
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
L1_1 = "Lua:FnameAttr!foxadminpro.exe"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = 12288
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = tostring
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = L0_1 - L1_1
L5_1 = L1_1
L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
if L2_1 ~= nil then
  L4_1 = L2_1
  L3_1 = L2_1.len
  L3_1 = L3_1(L4_1)
  if not (L3_1 < 8192) then
    goto lbl_49
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_49::
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "firepwd"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
