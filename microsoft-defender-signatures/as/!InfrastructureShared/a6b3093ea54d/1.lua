local L0_1, L1_1, L2_1, L3_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = nil
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L0_1 = L1_1.utf8p2
    if L0_1 ~= "" and L0_1 ~= nil then
      L1_1 = isTainted
      L2_1 = L0_1
      L3_1 = "remote_file_created_taint"
      L1_1 = L1_1(L2_1, L3_1)
      if not L1_1 then
        L1_1 = isTainted
        L2_1 = L0_1
        L3_1 = "mounted_file_execution"
        L1_1 = L1_1(L2_1, L3_1)
        if not L1_1 then
          goto lbl_40
        end
      end
      L1_1 = bm
      L1_1 = L1_1.add_related_file
      L2_1 = L0_1
      L1_1(L2_1)
      L1_1 = reportRelatedBmHits
      L1_1()
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
    ::lbl_40::
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L0_1 = IsTaintedProcessinParentTreeForLinux
L1_1 = "upx_file_created_taint"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = IsTaintedProcessinParentTreeForLinux
  L1_1 = "remote_file_created_taint"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = IsTaintedProcessinParentTreeForLinux
    L1_1 = "masqueraded_file_extension_taint"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = IsTaintedProcessinParentTreeForLinux
      L1_1 = "mounted_file_execution"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        goto lbl_70
      end
    end
  end
end
L0_1 = addRelatedProcess
L0_1()
L0_1 = reportRelatedBmHits
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_70::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
