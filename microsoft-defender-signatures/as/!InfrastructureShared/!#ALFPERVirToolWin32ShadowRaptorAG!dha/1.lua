local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if L0_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.len
  L1_1 = L1_1(L2_1)
  if 34 < L1_1 then
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = "ole db"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == nil then
      L2_1 = L0_1
      L1_1 = L0_1.find
      L3_1 = "migwiz"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 == nil then
        L2_1 = L0_1
        L1_1 = L0_1.find
        L3_1 = "aspdotnet"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if L1_1 == nil then
          goto lbl_110
        end
      end
    end
    L1_1 = "\\common files\\system\\ole db\\oledbjbn.inc"
    L2_1 = "\\common files\\system\\ole db\\oledbjml.inc"
    L3_1 = "\\windows\\system32\\migwiz\\sfcbn.dat"
    L4_1 = "\\windows\\system32\\migwiz\\sfcml.dat"
    L5_1 = "\\windows\\microsoft.net\\framework\\v2.0.50727\\asp.netwebadminfiles\\images\\aspdotnet_logo.gif"
    L6_1 = "\\windows\\microsoft.net\\framework\\v2.0.50727\\asp.netwebadminfiles\\images\\aspdotnet_logo_small.gif"
    L8_1 = L0_1
    L7_1 = L0_1.sub
    L9_1 = string
    L9_1 = L9_1.len
    L10_1 = L1_1
    L9_1 = L9_1(L10_1)
    L9_1 = -L9_1
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 ~= L1_1 then
      L8_1 = L0_1
      L7_1 = L0_1.sub
      L9_1 = string
      L9_1 = L9_1.len
      L10_1 = L2_1
      L9_1 = L9_1(L10_1)
      L9_1 = -L9_1
      L7_1 = L7_1(L8_1, L9_1)
      if L7_1 ~= L2_1 then
        L8_1 = L0_1
        L7_1 = L0_1.sub
        L9_1 = string
        L9_1 = L9_1.len
        L10_1 = L3_1
        L9_1 = L9_1(L10_1)
        L9_1 = -L9_1
        L7_1 = L7_1(L8_1, L9_1)
        if L7_1 ~= L3_1 then
          L8_1 = L0_1
          L7_1 = L0_1.sub
          L9_1 = string
          L9_1 = L9_1.len
          L10_1 = L4_1
          L9_1 = L9_1(L10_1)
          L9_1 = -L9_1
          L7_1 = L7_1(L8_1, L9_1)
          if L7_1 ~= L4_1 then
            L8_1 = L0_1
            L7_1 = L0_1.sub
            L9_1 = string
            L9_1 = L9_1.len
            L10_1 = L5_1
            L9_1 = L9_1(L10_1)
            L9_1 = -L9_1
            L7_1 = L7_1(L8_1, L9_1)
            if L7_1 ~= L5_1 then
              L8_1 = L0_1
              L7_1 = L0_1.sub
              L9_1 = string
              L9_1 = L9_1.len
              L10_1 = L6_1
              L9_1 = L9_1(L10_1)
              L9_1 = -L9_1
              L7_1 = L7_1(L8_1, L9_1)
              if L7_1 ~= L6_1 then
                goto lbl_106
              end
            end
          end
        end
      end
    end
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "MpNonPIIFileType"
    L7_1(L8_1)
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    do return L7_1 end
    goto lbl_113
    ::lbl_106::
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
end
else
  ::lbl_110::
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
::lbl_113::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
