local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = L0_1.command_line
    if L1_1 ~= "" then
      goto lbl_15
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = IsTaintedProcessinParentTreeForLinux
L2_1 = "upx_file_created_taint"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = IsTaintedProcessinParentTreeForLinux
  L2_1 = "remote_file_created_taint"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = IsTaintedProcessinParentTreeForLinux
    L2_1 = "masqueraded_file_extension_taint"
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L1_1 = IsTaintedProcessinParentTreeForLinux
      L2_1 = "mounted_file_execution"
      L1_1 = L1_1(L2_1)
      if not L1_1 then
        goto lbl_154
      end
    end
  end
end
L1_1 = L0_1.command_line
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "/elfsigner.py"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "--no_disclaimer"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    goto lbl_57
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_57::
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[8]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[8]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[8]
    L2_1 = L3_1.utf8p2
  end
end
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[10]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[10]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[10]
    L3_1 = L4_1.utf8p1
  end
end
L4_1 = nil
if L2_1 ~= nil then
  L6_1 = L2_1
  L5_1 = L2_1.match
  L7_1 = "-pass%s+file:([^%s]+)"
  L5_1 = L5_1(L6_1, L7_1)
  L4_1 = L5_1
end
if L4_1 ~= nil then
  L6_1 = L4_1
  L5_1 = L4_1.sub
  L7_1 = 1
  L8_1 = 1
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  if L5_1 ~= "/" then
    L5_1 = nil
    L6_1 = this_sigattrlog
    L6_1 = L6_1[9]
    L6_1 = L6_1.matched
    if L6_1 then
      L6_1 = this_sigattrlog
      L6_1 = L6_1[9]
      L6_1 = L6_1.utf8p1
      if L6_1 ~= nil then
        L6_1 = this_sigattrlog
        L6_1 = L6_1[9]
        L5_1 = L6_1.utf8p1
      end
    end
    
    function L6_1(A0_2)
      local L1_2, L2_2, L3_2, L4_2
      L2_2 = A0_2
      L1_2 = A0_2.reverse
      L1_2 = L1_2(L2_2)
      L3_2 = L1_2
      L2_2 = L1_2.match
      L4_2 = "([^/]+)"
      L2_2 = L2_2(L3_2, L4_2)
      L4_2 = L2_2
      L3_2 = L2_2.reverse
      return L3_2(L4_2)
    end
    
    get_basename = L6_1
    if L5_1 ~= nil then
      L6_1 = get_basename
      L7_1 = L4_1
      L6_1 = L6_1(L7_1)
      L7_1 = get_basename
      L8_1 = L5_1
      L7_1 = L7_1(L8_1)
      if L6_1 ~= nil and L7_1 ~= nil and L6_1 == L7_1 then
        L8_1 = addRelatedProcess
        L8_1()
        L8_1 = reportRelatedBmHits
        L8_1()
        L8_1 = mp
        L8_1 = L8_1.INFECTED
        return L8_1
      else
        L8_1 = mp
        L8_1 = L8_1.CLEAN
        return L8_1
      end
    end
  end
end
if L4_1 ~= nil and L3_1 ~= nil and L4_1 == L3_1 then
  L5_1 = addRelatedProcess
  L5_1()
  L5_1 = reportRelatedBmHits
  L5_1()
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
::lbl_154::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
