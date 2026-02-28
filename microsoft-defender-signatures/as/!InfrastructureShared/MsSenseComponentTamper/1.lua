local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = Remediation
if L0_1 ~= nil then
  L0_1 = Remediation
  L0_1 = L0_1.Threat
  if L0_1 ~= nil then
    L0_1 = Remediation
    L0_1 = L0_1.Threat
    L0_1 = L0_1.Name
    if L0_1 ~= nil then
      L0_1 = string
      L0_1 = L0_1.match
      L1_1 = Remediation
      L1_1 = L1_1.Threat
      L1_1 = L1_1.Name
      L2_1 = "Behavior:Win32/MsSenseComponentTamper.A"
      L0_1 = L0_1(L1_1, L2_1)
      if L0_1 then
        L0_1 = "BmMsSenseComponentTamperA"
        L1_1 = GetRollingQueue
        L2_1 = L0_1
        L1_1 = L1_1(L2_1)
        L2_1 = isnull
        L3_1 = L1_1
        L2_1 = L2_1(L3_1)
        if not L2_1 then
          L2_1 = pairs
          L3_1 = L1_1
          L2_1, L3_1, L4_1 = L2_1(L3_1)
          for L5_1 in L2_1, L3_1, L4_1 do
            L6_1 = L1_1[L5_1]
            L6_1 = L6_1.key
            if L6_1 ~= nil then
              L7_1 = sysio
              L7_1 = L7_1.IsFileExists
              L8_1 = L6_1
              L7_1 = L7_1(L8_1)
              if L7_1 then
                L7_1 = L1_1[L5_1]
                L7_1 = L7_1.value
                if L7_1 ~= nil then
                  L8_1 = StringEndsWith
                  L9_1 = string
                  L9_1 = L9_1.lower
                  L10_1 = L7_1
                  L9_1 = L9_1(L10_1)
                  L10_1 = ":\\program files\\windows defender advanced threat protection\\mssense.dll"
                  L8_1 = L8_1(L9_1, L10_1)
                  if L8_1 then
                    L8_1 = sysio
                    L8_1 = L8_1.MoveFile
                    L9_1 = L6_1
                    L10_1 = L7_1
                    L8_1(L9_1, L10_1)
                    L8_1 = "O:S-1-5-80-956008885-3418522649-1831038044-1853292631-2271478464D:P(A;;FA;;;S-1-5-80-956008885-3418522649-1831038044-1853292631-2271478464)(A;;GRGX;;;S-1-15-2-1)(A;;GRGX;;;S-1-15-2-2)(A;;GRGX;;;S-1-5-18)(A;;GRGX;;;S-1-5-32-544)(A;;GRGX;;;S-1-5-32-545)"
                    L9_1 = sysio
                    L9_1 = L9_1.ApplyFsSddl
                    L10_1 = L7_1
                    L11_1 = L8_1
                    L12_1 = false
                    L13_1 = false
                    L9_1(L10_1, L11_1, L12_1, L13_1)
                    break
                  end
                end
              end
            end
          end
          L2_1 = EraseRollingQueue
          L3_1 = L0_1
          L2_1(L3_1)
        end
      end
    end
  end
end
