local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L2_1 = pcall
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L2_1, L3_1 = L2_1(L3_1)
if L2_1 and L3_1 ~= nil then
  L0_1 = L3_1.ppid
  L1_1 = L3_1.image_path
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  L6_1 = L4_1
  L5_1 = L4_1.match
  L7_1 = "([^\\]+)$"
  L5_1 = L5_1(L6_1, L7_1)
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L5_1
  L8_1 = "fusioninventory-agent_windows"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if not L6_1 then
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L5_1
    L8_1 = "ledkeeper2.exe"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if not L6_1 then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L5_1
      L8_1 = "deviceconfiguratorsetup.exe"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if not L6_1 then
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L5_1
        L8_1 = "remote access.exe"
        L9_1 = 1
        L10_1 = true
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if not L6_1 then
          L6_1 = string
          L6_1 = L6_1.find
          L7_1 = L5_1
          L8_1 = "tailscaled.exe"
          L9_1 = 1
          L10_1 = true
          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
          if not L6_1 then
            L6_1 = string
            L6_1 = L6_1.find
            L7_1 = L5_1
            L8_1 = "dsc5x"
            L9_1 = 1
            L10_1 = true
            L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
            if not L6_1 then
              L6_1 = string
              L6_1 = L6_1.find
              L7_1 = L5_1
              L8_1 = "dsc-5"
              L9_1 = 1
              L10_1 = true
              L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
              if not L6_1 then
                L6_1 = string
                L6_1 = L6_1.find
                L7_1 = L5_1
                L8_1 = "aemagent.exe"
                L9_1 = 1
                L10_1 = true
                L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                if not L6_1 then
                  L6_1 = string
                  L6_1 = L6_1.find
                  L7_1 = L5_1
                  L8_1 = "skype.exe"
                  L9_1 = 1
                  L10_1 = true
                  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                  if not L6_1 then
                    goto lbl_111
                  end
                  L6_1 = string
                  L6_1 = L6_1.find
                  L7_1 = L4_1
                  L8_1 = ":\\program files"
                  L9_1 = 1
                  L10_1 = true
                  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                  if not L6_1 then
                    goto lbl_111
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  do return L6_1 end
  ::lbl_111::
  if L0_1 ~= nil and L1_1 ~= nil then
    L6_1 = TrackPidAndTechnique
    L7_1 = L0_1
    L8_1 = "T1562.004"
    L9_1 = "disablefirewall"
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = IsDetectionThresholdMet
    L7_1 = L0_1
    L6_1 = L6_1(L7_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    end
  end
end
L4_1 = mp
L4_1 = L4_1.LOWFI
return L4_1
