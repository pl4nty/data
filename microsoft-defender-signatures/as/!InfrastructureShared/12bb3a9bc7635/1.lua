local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.utf8p2
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = isnull
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = isnull
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    goto lbl_21
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
goto lbl_22
::lbl_21::
L1_1 = L1_1.ppid
::lbl_22::
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L2_1 = L3_1[2]
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L2_1 = L3_1[3]
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L2_1 = L3_1[4]
    else
      L3_1 = this_sigattrlog
      L3_1 = L3_1[5]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L2_1 = L3_1[5]
      else
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
    end
  end
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1.utf8p2
L5_1 = "^(%d+);regionsize:(%d+);"
L3_1, L4_1 = L3_1(L4_1, L5_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.format
L6_1 = "%s in %s. Executable code at base address %d"
L7_1 = L0_1
L8_1 = L1_1
L9_1 = L3_1
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
L6_1 = bm
L6_1 = L6_1.add_related_string
L7_1 = "ProcessHollowSummary"
L8_1 = L5_1
L9_1 = bm
L9_1 = L9_1.RelatedStringBMReport
L6_1(L7_1, L8_1, L9_1)
L6_1 = mp
L6_1 = L6_1.TriggerScanResource
L7_1 = "ems"
L8_1 = string
L8_1 = L8_1.format
L9_1 = "%s,address:%d,size:%d,options:+"
L10_1 = L1_1
L11_1 = L3_1
L12_1 = L4_1
L8_1, L9_1, L10_1, L11_1, L12_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
