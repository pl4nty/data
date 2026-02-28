local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.command_line
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1()
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if not (L3_1 < 1) then
    goto lbl_22
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_22::
L3_1 = string
L3_1 = L3_1.find
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L5_1 = "\\program files"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  L5_1 = "\\system32"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    goto lbl_49
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_49::
if L1_1 ~= nil then
  L3_1 = #L1_1
  if not (L3_1 < 1) then
    goto lbl_57
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_57::
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "\\program files"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = "system32"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    goto lbl_78
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_78::
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
