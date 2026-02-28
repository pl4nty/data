local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "powershell"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = pe
  L1_1 = L1_1.get_versioninfo
  L1_1 = L1_1()
  if L1_1 ~= nil then
    L2_1 = L1_1.OriginalFilename
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = L1_1.OriginalFilename
      L2_1 = L2_1(L3_1)
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "powerleech.dll"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L2_1
        L3_1 = L2_1.find
        L5_1 = "ddcpowershellhelper.dll"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L4_1 = L2_1
          L3_1 = L2_1.find
          L5_1 = "cylance.dotnethookhelper.dll"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            goto lbl_52
          end
        end
      end
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
  end
  ::lbl_52::
  L2_1 = TrackPidAndTechnique
  L3_1 = "AMSI"
  L4_1 = "T1562.001"
  L5_1 = "amsitampering"
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
