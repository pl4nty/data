local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p1
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p1
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L0_1 = L1_1.utf8p1
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[4]
        L0_1 = L1_1.utf8p1
      end
    end
  end
end
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = -4
  L1_1 = L1_1(L2_1, L3_1)
  L2_1 = "|.asp|aspx|ashx|asmx|"
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = L1_1
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    goto lbl_67
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_67::
L2_1 = {}
L3_1 = {}
L4_1 = "w3wp.exe"
L5_1 = "-ap \"msexchange"
L3_1[1] = L4_1
L3_1[2] = L5_1
L2_1[1] = L3_1
L3_1 = checkParentCmdline
L4_1 = L1_1.ppid
L5_1 = L2_1
L6_1 = 5
L3_1 = L3_1(L4_1, L5_1, L6_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.add_related_file
L4_1 = L0_1
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
