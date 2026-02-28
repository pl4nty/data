local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L2_1 = L0_1
L1_1 = L0_1.len
L1_1 = L1_1(L2_1)
L2_1 = false
if 16 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -16
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "->Enter 1234.txt" then
    goto lbl_142
  end
end
if 14 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -14
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "->Use_1234.txt" then
    goto lbl_142
  end
end
if 14 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -14
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "->Use 1234.txt" then
    goto lbl_142
  end
end
if 26 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -26
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "->USE PASSWORD - 12345.txt" then
    goto lbl_142
  end
end
if 17 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -17
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "->Use 1 2 3 4.txt" then
    goto lbl_142
  end
end
if 21 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -21
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "->Password = 1234.txt" then
    goto lbl_142
  end
end
if 23 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -23
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "->you should write 1234" then
    goto lbl_142
  end
end
if 32 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -32
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "->1234 is what should be written" then
    goto lbl_142
  end
end
if 13 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -13
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "->key is 1234" then
    goto lbl_142
  end
end
if 18 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -18
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "->1234 for opening" then
    goto lbl_142
  end
end
if 15 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -15
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "->to unzip 1234" then
    goto lbl_142
  end
end
if 21 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -21
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "->1234 for extracting" then
    goto lbl_142
  end
end
if 13 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -13
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "->to run 1234" then
    goto lbl_142
  end
end
if 24 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -24
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "->Password is-  1234.txt" then
    goto lbl_142
  end
end
if 25 < L1_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -25
  L3_1 = L3_1(L4_1, L5_1)
  ::lbl_142::
  if L3_1 == "->Password is -  1234.txt" then
    L2_1 = true
  end
end
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_parent_filehandle
L3_1 = L3_1()
L4_1 = mp
L4_1 = L4_1.is_handle_nil
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.readfile_by_handle
L5_1 = L3_1
L6_1 = 0
L7_1 = 6
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 ~= "7z\188\175'\028" and L4_1 ~= "Rar!\026\a" then
  L5_1 = mp
  L5_1 = L5_1.readu_u32
  L6_1 = L4_1
  L7_1 = 1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 ~= 67324752 then
    goto lbl_184
  end
end
L5_1 = mp
L5_1 = L5_1.INFECTED
do return L5_1 end
::lbl_184::
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
