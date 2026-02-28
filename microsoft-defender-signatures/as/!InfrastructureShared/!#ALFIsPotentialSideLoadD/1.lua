local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "c:\\windows"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "c:\\program files"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "c:\\"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 ~= nil then
      goto lbl_37
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_37::
L1_1 = pe
L1_1 = L1_1.get_exports
L1_1, L2_1 = L1_1()
if L1_1 == nil or L1_1 < 8 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 2
L4_1 = L1_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = L6_1 - 1
  L7_1 = L2_1[L7_1]
  L7_1 = L7_1.rva
  L8_1 = L2_1[L6_1]
  L8_1 = L8_1.rva
  if L7_1 ~= L8_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = false
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.getfilesize
L3_1 = L3_1()
if L3_1 == nil or L3_1 <= 288 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = "\135S!\195\1952O\144\1952O\144\1952O\144\030\205\133\144\1942O\144\030\205\129\144\1932O\144\030\205\134\144\1942O\144\030\205\131\144\1942O\144Rich"
L6_1 = "?\133\163\222{\228\205\141{\228\205\141{\228\205\141r\156_\141z\228\205\141r\156N\141y\228\205\141r\156Y\141z\228\205\141r\156\\\141z\228\205\141Rich{\228\205\141\000\000"
L4_1[1] = L5_1
L4_1[2] = L6_1
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = 128
L7_1 = 64
L5_1 = L5_1(L6_1, L7_1)
L6_1 = 1
L7_1 = #L4_1
L8_1 = 1
for L9_1 = L6_1, L7_1, L8_1 do
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L5_1
  L12_1 = L4_1[L9_1]
  L13_1 = 1
  L14_1 = true
  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  if L10_1 ~= nil then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
end
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
