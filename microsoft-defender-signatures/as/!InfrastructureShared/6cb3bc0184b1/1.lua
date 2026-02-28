local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
if L1_1 ~= nil then
  L3_1 = ipairs
  L4_1 = L1_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1.image_path
    if L8_1 ~= nil then
      L8_1 = string
      L8_1 = L8_1.lower
      L9_1 = MpCommon
      L9_1 = L9_1.PathToWin32Path
      L10_1 = L7_1.image_path
      L9_1, L10_1, L11_1, L12_1 = L9_1(L10_1)
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      L0_1 = L8_1
      L8_1 = string
      L8_1 = L8_1.find
      L9_1 = L0_1
      L10_1 = "\\taniumclient.exe"
      L11_1 = -17
      L12_1 = true
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      if not L8_1 then
        L8_1 = string
        L8_1 = L8_1.find
        L9_1 = L0_1
        L10_1 = "\\wbem\\wmiprvse.exe"
        L11_1 = -18
        L12_1 = true
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
        if not L8_1 then
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L0_1
          L10_1 = "\\microsoft intune management extension\\agentexecutor.exe"
          L11_1 = -56
          L12_1 = true
          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
          if not L8_1 then
            L8_1 = string
            L8_1 = L8_1.find
            L9_1 = L0_1
            L10_1 = "\\netlogon\\mdatp\\windowsdefenderatponboardingscript.cmd"
            L11_1 = -54
            L12_1 = true
            L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
            if not L8_1 then
              L8_1 = string
              L8_1 = L8_1.find
              L9_1 = L0_1
              L10_1 = "\\qualysagent\\qualysagent.exe"
              L11_1 = -28
              L12_1 = true
              L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
              if not L8_1 then
                L8_1 = string
                L8_1 = L8_1.find
                L9_1 = L0_1
                L10_1 = "\\quest\\kace\\kdeploy.exe"
                L11_1 = -23
                L12_1 = true
                L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                if not L8_1 then
                  L8_1 = string
                  L8_1 = L8_1.find
                  L9_1 = L0_1
                  L10_1 = "\\windows defender advanced threat protection\\senseir.exe"
                  L11_1 = -56
                  L12_1 = true
                  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                  if not L8_1 then
                    L8_1 = string
                    L8_1 = L8_1.find
                    L9_1 = L0_1
                    L10_1 = "\\sng\\abtsngsvc.exe"
                    L11_1 = -18
                    L12_1 = true
                    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                    if not L8_1 then
                      goto lbl_96
                    end
                  end
                end
              end
            end
          end
        end
      end
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
    ::lbl_96::
    L8_1 = sysio
    L8_1 = L8_1.IsFileExists
    L9_1 = L0_1
    L8_1 = L8_1(L9_1)
    if L8_1 then
      L8_1 = mp
      L8_1 = L8_1.IsKnownFriendlyFile
      L9_1 = L0_1
      L10_1 = true
      L11_1 = false
      L8_1 = L8_1(L9_1, L10_1, L11_1)
      if not L8_1 then
        L8_1 = bm
        L8_1 = L8_1.add_related_file
        L9_1 = L0_1
        L8_1(L9_1)
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
