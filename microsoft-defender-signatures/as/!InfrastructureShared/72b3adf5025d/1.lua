local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = SuspMacPathsToMonitor
L2_1 = L0_1
L3_1 = true
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "/Users/[^/]+/Downloads/"
  L4_1 = 1
  L5_1 = false
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "/Users/[^/]+/Documents/"
    L4_1 = 1
    L5_1 = false
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "/Users/[^/]+/Desktop/"
      L4_1 = 1
      L5_1 = false
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        goto lbl_47
      end
    end
  end
end
L1_1 = sysio
L1_1 = L1_1.IsFileExists
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = bm
  L1_1 = L1_1.add_threat_file
  L2_1 = L0_1
  L1_1(L2_1)
end
::lbl_47::
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
