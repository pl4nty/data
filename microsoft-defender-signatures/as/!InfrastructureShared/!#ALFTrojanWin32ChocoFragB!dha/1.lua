local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 8000000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
if L0_1 < 204800 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FULL
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "\\windows\\system32\\sys.dat"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "\\windows\\system32\\richlog.dat"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "\\windows\\system32\\flash.dat"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L3_1 = L1_1
      L2_1 = L1_1.find
      L4_1 = "\\windows\\system32\\main.dat"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L3_1 = L1_1
        L2_1 = L1_1.find
        L4_1 = "\\windows\\system32\\actionlist.xml"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          L3_1 = L1_1
          L2_1 = L1_1.find
          L4_1 = "\\windows\\system32\\wbem\\microsoft.net.props"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if not L2_1 then
            goto lbl_73
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "MpNonPIIFileType"
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_73::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
