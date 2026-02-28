local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L2_1()
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "\\hummingheads\\securityplatform\\bktask.exe"
  L4_1 = -41
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\\hummingheads\\securityplatform\\bkhost.exe"
    L4_1 = -41
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      goto lbl_33
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_33::
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
if L2_1 ~= nil then
  L3_1 = ipairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1.image_path
    if L8_1 ~= nil then
      L8_1 = L7_1.reason
      L9_1 = bm
      L9_1 = L9_1.RELATIONSHIP_INJECTION
      if L8_1 == L9_1 then
        L8_1 = string
        L8_1 = L8_1.lower
        L9_1 = L7_1.image_path
        L8_1 = L8_1(L9_1)
        L9_1 = string
        L9_1 = L9_1.find
        L10_1 = L8_1
        L11_1 = "\\powershell.exe"
        L12_1 = -15
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if L9_1 then
          L9_1 = TrackPidAndTechniqueBM
          L10_1 = "BM"
          L11_1 = "T1055.002"
          L12_1 = "portable_executable_injection"
          L9_1(L10_1, L11_1, L12_1)
          L9_1 = mp
          L9_1 = L9_1.INFECTED
          return L9_1
        end
      end
    end
  end
end
if L1_1 ~= nil then
  L3_1 = ipairs
  L4_1 = L1_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1.image_path
    if L8_1 ~= nil then
      L8_1 = L7_1.reason
      L9_1 = bm
      L9_1 = L9_1.RELATIONSHIP_INJECTION
      if L8_1 == L9_1 then
        L8_1 = string
        L8_1 = L8_1.lower
        L9_1 = L7_1.image_path
        L8_1 = L8_1(L9_1)
        L9_1 = string
        L9_1 = L9_1.find
        L10_1 = L8_1
        L11_1 = "\\powershell.exe"
        L12_1 = -15
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if L9_1 then
          L9_1 = TrackPidAndTechniqueBM
          L10_1 = "BM"
          L11_1 = "T1055.002"
          L12_1 = "portable_executable_injection"
          L9_1(L10_1, L11_1, L12_1)
          L9_1 = mp
          L9_1 = L9_1.INFECTED
          return L9_1
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
