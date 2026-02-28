local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = string
L0_1 = L0_1.match
L1_1 = string
L1_1 = L1_1.lower
L2_1 = Remediation
L2_1 = L2_1.Threat
L2_1 = L2_1.Name
L1_1 = L1_1(L2_1)
L2_1 = "bitsabuse"
L0_1 = L0_1(L1_1, L2_1)
if L0_1 then
  L0_1 = string
  L0_1 = L0_1.match
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = Remediation
  L2_1 = L2_1.Threat
  L2_1 = L2_1.Name
  L1_1 = L1_1(L2_1)
  L2_1 = "bitsabuse.z"
  L0_1 = L0_1(L1_1, L2_1)
  if not L0_1 then
    L0_1 = string
    L0_1 = L0_1.match
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = Remediation
    L2_1 = L2_1.Threat
    L2_1 = L2_1.Name
    L1_1 = L1_1(L2_1)
    L2_1 = "bitsabuse.y"
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      L0_1 = MpCommon
      L0_1 = L0_1.ExpandEnvironmentVariables
      L1_1 = "%ProgramData%"
      L0_1 = L0_1(L1_1)
      L1_1 = sysio
      L1_1 = L1_1.IsFileExists
      L2_1 = L0_1
      L3_1 = "\\microsoft\\network\\downloader\\qmgr.db"
      L2_1 = L2_1 .. L3_1
      L1_1 = L1_1(L2_1)
      if L1_1 == nil then
        L1_1 = sysio
        L1_1 = L1_1.IsFileExists
        L2_1 = L0_1
        L3_1 = "\\microsoft\\network\\downloader\\qmgr0.dat"
        L2_1 = L2_1 .. L3_1
        L1_1 = L1_1(L2_1)
        if L1_1 == nil then
          goto lbl_194
        end
      end
      L1_1 = sysio
      L1_1 = L1_1.EnumerateBitsJobs
      L1_1 = L1_1()
      if L1_1 == nil then
        return
      end
      L2_1 = {}
      L3_1 = "sonyerrorreport"
      L2_1[1] = L3_1
      L3_1 = {}
      L4_1 = "errorreportclient.exe"
      L3_1[1] = L4_1
      L4_1 = pairs
      L5_1 = L1_1
      L4_1, L5_1, L6_1 = L4_1(L5_1)
      for L7_1, L8_1 in L4_1, L5_1, L6_1 do
        L9_1 = string
        L9_1 = L9_1.lower
        L10_1 = L8_1.JobName
        L9_1 = L9_1(L10_1)
        if L9_1 == "" or L9_1 == nil then
          return
        end
        L10_1 = string
        L10_1 = L10_1.lower
        L11_1 = L8_1.NotifyCmdProgram
        L10_1 = L10_1(L11_1)
        if L10_1 == "" or L10_1 == nil then
          return
        end
        L11_1 = 1
        L12_1 = #L2_1
        L13_1 = 1
        for L14_1 = L11_1, L12_1, L13_1 do
          L15_1 = string
          L15_1 = L15_1.find
          L16_1 = L9_1
          L17_1 = L2_1[L14_1]
          L18_1 = 1
          L19_1 = true
          L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
          if L15_1 ~= nil then
            return
          end
        end
        L11_1 = 1
        L12_1 = #L3_1
        L13_1 = 1
        for L14_1 = L11_1, L12_1, L13_1 do
          L15_1 = string
          L15_1 = L15_1.find
          L16_1 = L10_1
          L17_1 = L3_1[L14_1]
          L18_1 = 1
          L19_1 = true
          L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
          if L15_1 ~= nil then
            return
          end
        end
        L11_1 = string
        L11_1 = L11_1.match
        L12_1 = string
        L12_1 = L12_1.lower
        L13_1 = L8_1.NotifyCmdProgramParam
        L12_1 = L12_1(L13_1)
        L13_1 = "http[s]?%:%/%/.-%/"
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 ~= nil then
          L11_1 = sysio
          L11_1 = L11_1.DeleteBitsJob
          L12_1 = L8_1.JobId
          L11_1(L12_1)
        end
        L11_1 = L8_1.JobFiles
        if L11_1 == nil then
          return
        end
        L11_1 = ipairs
        L12_1 = L8_1.JobFiles
        L11_1, L12_1, L13_1 = L11_1(L12_1)
        for L14_1, L15_1 in L11_1, L12_1, L13_1 do
          L16_1 = 0
          L17_1 = string
          L17_1 = L17_1.lower
          L18_1 = L15_1.FileRemoteName
          L17_1 = L17_1(L18_1)
          L18_1 = L8_1.JobType
          if L18_1 == L16_1 then
            L18_1 = string
            L18_1 = L18_1.match
            L19_1 = L17_1
            L20_1 = "^http[s]?%:%/%/.-%/"
            L18_1 = L18_1(L19_1, L20_1)
            if L18_1 == nil then
              L18_1 = string
              L18_1 = L18_1.match
              L19_1 = L17_1
              L20_1 = "^\\\\localhost\\%a%$\\"
              L18_1 = L18_1(L19_1, L20_1)
              if L18_1 == nil then
                L18_1 = string
                L18_1 = L18_1.match
                L19_1 = L17_1
                L20_1 = "^\\\\127.0.0.1\\%a%$\\"
                L18_1 = L18_1(L19_1, L20_1)
                if L18_1 == nil then
                  L18_1 = string
                  L18_1 = L18_1.match
                  L19_1 = L17_1
                  L20_1 = "^%a:\\.+"
                  L18_1 = L18_1(L19_1, L20_1)
                  if L18_1 == nil then
                    L18_1 = string
                    L18_1 = L18_1.match
                    L19_1 = L17_1
                    L20_1 = "^%%%a+%%"
                    L18_1 = L18_1(L19_1, L20_1)
                    if L18_1 == nil then
                      goto lbl_190
                    end
                  end
                end
              end
              L18_1 = sysio
              L18_1 = L18_1.DeleteBitsJob
              L19_1 = L8_1.JobId
              L18_1(L19_1)
            end
          end
          ::lbl_190::
        end
      end
    end
  end
end
::lbl_194::
