local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 == L1_1 then
  L1_1 = pcall
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_AMSI_APPNAME
  L1_1, L2_1 = L1_1(L2_1, L3_1)
  L3_1 = {}
  L3_1.vbs = true
  L3_1.ps1 = true
  L3_1[".js"] = true
  L3_1.jse = true
  L3_1.vbe = true
  if L1_1 and L2_1 then
    L4_1 = pcall
    L5_1 = mp
    L5_1 = L5_1.get_contextdata
    L6_1 = mp
    L6_1 = L6_1.CONTEXT_DATA_AMSI_CONTENTNAME
    L4_1, L5_1 = L4_1(L5_1, L6_1)
    if L4_1 and L5_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = L5_1
      L6_1 = L6_1(L7_1)
      L8_1 = L6_1
      L7_1 = L6_1.find
      L9_1 = "\\desktop\\"
      L10_1 = 1
      L11_1 = true
      L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
      if not L7_1 then
        L8_1 = L6_1
        L7_1 = L6_1.find
        L9_1 = "\\downloads\\"
        L10_1 = 1
        L11_1 = true
        L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
        if not L7_1 then
          L8_1 = L6_1
          L7_1 = L6_1.find
          L9_1 = "\\documents\\"
          L10_1 = 1
          L11_1 = true
          L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
          if not L7_1 then
            goto lbl_97
          end
        end
      end
      L8_1 = L6_1
      L7_1 = L6_1.find
      L9_1 = "\\tanium\\"
      L10_1 = 1
      L11_1 = true
      L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
      if not L7_1 then
        L7_1 = sysio
        L7_1 = L7_1.IsFileExists
        L8_1 = L5_1
        L7_1 = L7_1(L8_1)
        if L7_1 then
          L7_1 = string
          L7_1 = L7_1.sub
          L8_1 = L6_1
          L9_1 = -3
          L7_1 = L7_1(L8_1, L9_1)
          if L7_1 ~= nil then
            L8_1 = L3_1[L7_1]
            if L8_1 == true then
              L8_1 = TrackPidAndTechnique
              L9_1 = "AMSI"
              L10_1 = "T1204"
              L11_1 = "UserExecution"
              L8_1(L9_1, L10_1, L11_1)
              L8_1 = mp
              L8_1 = L8_1.ReportLowfi
              L9_1 = L5_1
              L10_1 = 308930296
              L8_1(L9_1, L10_1)
              L8_1 = mp
              L8_1 = L8_1.INFECTED
              return L8_1
            end
          end
        end
      end
    end
  end
  ::lbl_97::
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
