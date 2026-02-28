local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L0_1 = L2_1[2]
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L0_1 = L2_1[3]
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L0_1 = L2_1[4]
    end
  end
end
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
L1_1 = L2_1
L2_1 = isnull
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = isnull
  L3_1 = L0_1.utf8p1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = isnull
    L3_1 = L0_1.utf8p2
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L2_1 = isnull
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      if not L2_1 then
        L2_1 = isnull
        L3_1 = L1_1.ppid
        L2_1 = L2_1(L3_1)
        if not L2_1 then
          goto lbl_56
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_56::
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1.utf8p2
L4_1 = "^([0-9]+);regionsize:([0-9]+)"
L2_1, L3_1 = L2_1(L3_1, L4_1)
L4_1 = string
L4_1 = L4_1.match
L5_1 = L0_1.utf8p1
L6_1 = "^([0-9]+:[0-9]+)"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = isnull
L6_1 = L2_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = isnull
  L6_1 = L3_1
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    L5_1 = isnull
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if not L5_1 then
      L5_1 = tonumber
      L6_1 = L3_1
      L5_1 = L5_1(L6_1)
      if not (100 <= L5_1) then
        goto lbl_89
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_89::
L5_1 = bm
L5_1 = L5_1.GetProcAddress
L6_1 = L1_1.ppid
L7_1 = "amsi.dll"
L8_1 = "AmsiInitialize"
L5_1 = L5_1(L6_1, L7_1, L8_1)
L6_1 = isnull
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = bm
L6_1 = L6_1.VirtualQuery
L7_1 = L5_1
L6_1, L7_1 = L6_1(L7_1)
if L6_1 then
  L8_1 = L7_1.base_addr
  L9_1 = tonumber
  L10_1 = L2_1
  L9_1 = L9_1(L10_1)
  if L8_1 == L9_1 then
    goto lbl_118
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_118::
L8_1 = {}
L8_1.function_name = "AmsiInitialize"
L8_1.amsi_address = L5_1
L8_1.prot_base_addr = L2_1
L8_1.prot_constant = L4_1
L8_1.region_size = L3_1
L9_1 = safeJsonSerialize
L10_1 = L8_1
L9_1 = L9_1(L10_1)
L10_1 = bm
L10_1 = L10_1.add_related_string
L11_1 = "AMSIPatchEDR"
L12_1 = L9_1
L13_1 = bm
L13_1 = L13_1.RelatedStringBMReport
L10_1(L11_1, L12_1, L13_1)
L10_1 = bm
L10_1 = L10_1.set_detection_string
L11_1 = L9_1
L10_1(L11_1)
L10_1 = mp
L10_1 = L10_1.INFECTED
return L10_1
