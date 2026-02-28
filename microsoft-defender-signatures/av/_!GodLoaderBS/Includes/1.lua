local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.getfilesize
L0_1, L1_1 = L0_1(L1_1)
if L0_1 then
  L2_1 = isnull
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    goto lbl_19
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_19::
if 65536 < L1_1 then
  L2_1 = 65536
  L1_1 = L2_1 or L1_1
  if not L2_1 then
  end
end
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 0
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
L3_1 = isnull
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = tostring
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = true
L3_1(L4_1)
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "GDPC"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "GDPC"
L6_1 = 5
L7_1 = true
L3_1 = L3_1 == 1 or L3_1
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = "add-mppreference"
L6_1 = "runas"
L4_1[1] = L5_1
L4_1[2] = L6_1

function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = ipairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L8_2 = A0_2
    L7_2 = A0_2.find
    L9_2 = L6_2
    L10_2 = 1
    L11_2 = true
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
    if L7_2 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = false
  return L2_2
end

L6_1 = string
L6_1 = L6_1.lower
L7_1 = L2_1
L6_1 = L6_1(L7_1)
L2_1 = L6_1
L6_1 = L5_1
L7_1 = L2_1
L8_1 = L4_1
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L7_1 = L2_1
  L6_1 = L2_1.find
  L8_1 = "res://control.gd"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if not L6_1 then
    goto lbl_105
  end
  L7_1 = L2_1
  L6_1 = L2_1.find
  L8_1 = "res://control.tscn.remap"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if not L6_1 then
    goto lbl_105
  end
end
L6_1 = set_research_data
L7_1 = "[=>] GODOT_PCK_HEADER: "
L8_1 = tostring
L9_1 = L4_1
L8_1 = L8_1(L9_1)
L9_1 = false
L6_1(L7_1, L8_1, L9_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
do return L6_1 end
::lbl_105::
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
