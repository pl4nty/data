local L0_1, L1_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2
  L0_2 = MpCommon
  L0_2 = L0_2.ExpandEnvironmentVariables
  L1_2 = "%ProgramData%"
  L0_2 = L0_2(L1_2)
  L1_2 = sysio
  L1_2 = L1_2.IsFileExists
  L2_2 = L0_2
  L3_2 = "\\microsoft\\network\\downloader\\qmgr.db"
  L2_2 = L2_2 .. L3_2
  L1_2 = L1_2(L2_2)
  if L1_2 == nil then
    L1_2 = sysio
    L1_2 = L1_2.IsFileExists
    L2_2 = L0_2
    L3_2 = "\\microsoft\\network\\downloader\\qmgr0.dat"
    L2_2 = L2_2 .. L3_2
    L1_2 = L1_2(L2_2)
    if L1_2 == nil then
      goto lbl_413
    end
  end
  L1_2 = sysio
  L1_2 = L1_2.EnumerateBitsJobs
  L1_2 = L1_2()
  if L1_2 == nil then
    return
  end
  L2_2 = {}
  L3_2 = "sonyerrorreport"
  L2_2[1] = L3_2
  L3_2 = {}
  L4_2 = "errorreportclient.exe"
  L3_2[1] = L4_2
  L4_2 = {}
  L5_2 = "windowsimages"
  L6_2 = "windowsbackup"
  L7_2 = "windowssearchcache"
  L8_2 = "electricweb"
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L5_2 = {}
  L6_2 = "footballtimes"
  L7_2 = "vegetableportfolio"
  L8_2 = "windowsearchcache"
  L9_2 = "electricalweb"
  L10_2 = "upnpdiscover"
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L6_2 = {}
  L7_2 = "dsc"
  L8_2 = "sld"
  L9_2 = "plx"
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L7_2 = pairs
  L8_2 = L1_2
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  for L10_2, L11_2 in L7_2, L8_2, L9_2 do
    L12_2 = string
    L12_2 = L12_2.lower
    L13_2 = L11_2.JobName
    L12_2 = L12_2(L13_2)
    if L12_2 == "" or L12_2 == nil then
      return
    end
    L13_2 = string
    L13_2 = L13_2.lower
    L14_2 = L11_2.NotifyCmdProgram
    L13_2 = L13_2(L14_2)
    if L13_2 == "" or L13_2 == nil then
      return
    end
    L14_2 = 1
    L15_2 = #L2_2
    L16_2 = 1
    for L17_2 = L14_2, L15_2, L16_2 do
      L18_2 = string
      L18_2 = L18_2.find
      L19_2 = L12_2
      L20_2 = L2_2[L17_2]
      L21_2 = 1
      L22_2 = true
      L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
      if L18_2 ~= nil then
        return
      end
    end
    L14_2 = 1
    L15_2 = #L3_2
    L16_2 = 1
    for L17_2 = L14_2, L15_2, L16_2 do
      L18_2 = string
      L18_2 = L18_2.find
      L19_2 = L13_2
      L20_2 = L3_2[L17_2]
      L21_2 = 1
      L22_2 = true
      L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
      if L18_2 ~= nil then
        return
      end
    end
    L14_2 = false
    L15_2 = false
    L16_2 = false
    L17_2 = 1
    L18_2 = #L4_2
    L19_2 = 1
    for L20_2 = L17_2, L18_2, L19_2 do
      L21_2 = string
      L21_2 = L21_2.find
      L22_2 = L12_2
      L23_2 = L4_2[L20_2]
      L24_2 = 1
      L25_2 = true
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2)
      if L21_2 ~= nil then
        L14_2 = true
        break
      end
    end
    L17_2 = string
    L17_2 = L17_2.match
    L18_2 = string
    L18_2 = L18_2.lower
    L19_2 = L11_2.NotifyCmdProgramParam
    L18_2 = L18_2(L19_2)
    L19_2 = "http[s]?%:%/%/.-%/"
    L17_2 = L17_2(L18_2, L19_2)
    if L17_2 ~= nil then
      L17_2 = string
      L17_2 = L17_2.format
      L18_2 = "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x"
      L19_2 = string
      L19_2 = L19_2.byte
      L20_2 = L11_2.JobId
      L21_2 = 4
      L19_2 = L19_2(L20_2, L21_2)
      L20_2 = string
      L20_2 = L20_2.byte
      L21_2 = L11_2.JobId
      L22_2 = 3
      L20_2 = L20_2(L21_2, L22_2)
      L21_2 = string
      L21_2 = L21_2.byte
      L22_2 = L11_2.JobId
      L23_2 = 2
      L21_2 = L21_2(L22_2, L23_2)
      L22_2 = string
      L22_2 = L22_2.byte
      L23_2 = L11_2.JobId
      L24_2 = 1
      L22_2 = L22_2(L23_2, L24_2)
      L23_2 = string
      L23_2 = L23_2.byte
      L24_2 = L11_2.JobId
      L25_2 = 6
      L23_2 = L23_2(L24_2, L25_2)
      L24_2 = string
      L24_2 = L24_2.byte
      L25_2 = L11_2.JobId
      L26_2 = 5
      L24_2 = L24_2(L25_2, L26_2)
      L25_2 = string
      L25_2 = L25_2.byte
      L26_2 = L11_2.JobId
      L27_2 = 8
      L25_2 = L25_2(L26_2, L27_2)
      L26_2 = string
      L26_2 = L26_2.byte
      L27_2 = L11_2.JobId
      L28_2 = 7
      L26_2 = L26_2(L27_2, L28_2)
      L27_2 = string
      L27_2 = L27_2.byte
      L28_2 = L11_2.JobId
      L29_2 = 9
      L30_2 = 16
      L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2 = L27_2(L28_2, L29_2, L30_2)
      L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2)
      L18_2 = MpDetection
      L18_2 = L18_2.ReportResource
      L19_2 = "bitsjob"
      L20_2 = L17_2
      L21_2 = 3345
      L22_2 = false
      L23_2 = false
      L18_2(L19_2, L20_2, L21_2, L22_2, L23_2)
    end
    L17_2 = L11_2.JobFiles
    if L17_2 == nil then
      return
    end
    L17_2 = ipairs
    L18_2 = L11_2.JobFiles
    L17_2, L18_2, L19_2 = L17_2(L18_2)
    for L20_2, L21_2 in L17_2, L18_2, L19_2 do
      L22_2 = string
      L22_2 = L22_2.lower
      L23_2 = L21_2.FileLocalName
      L22_2 = L22_2(L23_2)
      if L14_2 == true then
        L23_2 = 1
        L24_2 = L6_2
        L25_2 = 1
        for L26_2 = L23_2, L24_2, L25_2 do
          L27_2 = string
          L27_2 = L27_2.find
          L28_2 = L22_2
          L29_2 = L6_2[L26_2]
          L30_2 = 1
          L31_2 = true
          L27_2 = L27_2(L28_2, L29_2, L30_2, L31_2)
          if L27_2 ~= nil and L27_2 == 1 then
            L16_2 = true
            break
          end
        end
      end
      L23_2 = string
      L23_2 = L23_2.lower
      L24_2 = L21_2.FileRemoteName
      L23_2 = L23_2(L24_2)
      if L16_2 == true then
        L24_2 = 1
        L25_2 = #L5_2
        L26_2 = 1
        for L27_2 = L24_2, L25_2, L26_2 do
          L28_2 = string
          L28_2 = L28_2.find
          L29_2 = L23_2
          L30_2 = L5_2[L27_2]
          L31_2 = 1
          L32_2 = true
          L28_2 = L28_2(L29_2, L30_2, L31_2, L32_2)
          if L28_2 ~= nil then
            L15_2 = true
            break
          end
        end
      end
      L24_2 = 0
      L25_2 = L11_2.JobType
      if L25_2 == L24_2 then
        L25_2 = string
        L25_2 = L25_2.match
        L26_2 = L23_2
        L27_2 = "^http[s]?%:%/%/.-%/"
        L25_2 = L25_2(L26_2, L27_2)
        if L25_2 == nil then
          L25_2 = string
          L25_2 = L25_2.match
          L26_2 = L23_2
          L27_2 = "^\\\\localhost\\%a%$\\"
          L25_2 = L25_2(L26_2, L27_2)
          if L25_2 == nil then
            L25_2 = string
            L25_2 = L25_2.match
            L26_2 = L23_2
            L27_2 = "^\\\\127.0.0.1\\%a%$\\"
            L25_2 = L25_2(L26_2, L27_2)
            if L25_2 == nil then
              L25_2 = string
              L25_2 = L25_2.match
              L26_2 = L23_2
              L27_2 = "^%a:\\.+"
              L25_2 = L25_2(L26_2, L27_2)
              if L25_2 == nil then
                L25_2 = string
                L25_2 = L25_2.match
                L26_2 = L23_2
                L27_2 = "^%%%a+%%"
                L25_2 = L25_2(L26_2, L27_2)
                if L25_2 == nil then
                  goto lbl_341
                end
              end
            end
          end
          L25_2 = string
          L25_2 = L25_2.format
          L26_2 = "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x"
          L27_2 = string
          L27_2 = L27_2.byte
          L28_2 = L11_2.JobId
          L29_2 = 4
          L27_2 = L27_2(L28_2, L29_2)
          L28_2 = string
          L28_2 = L28_2.byte
          L29_2 = L11_2.JobId
          L30_2 = 3
          L28_2 = L28_2(L29_2, L30_2)
          L29_2 = string
          L29_2 = L29_2.byte
          L30_2 = L11_2.JobId
          L31_2 = 2
          L29_2 = L29_2(L30_2, L31_2)
          L30_2 = string
          L30_2 = L30_2.byte
          L31_2 = L11_2.JobId
          L32_2 = 1
          L30_2 = L30_2(L31_2, L32_2)
          L31_2 = string
          L31_2 = L31_2.byte
          L32_2 = L11_2.JobId
          L33_2 = 6
          L31_2 = L31_2(L32_2, L33_2)
          L32_2 = string
          L32_2 = L32_2.byte
          L33_2 = L11_2.JobId
          L34_2 = 5
          L32_2 = L32_2(L33_2, L34_2)
          L33_2 = string
          L33_2 = L33_2.byte
          L34_2 = L11_2.JobId
          L35_2 = 8
          L33_2 = L33_2(L34_2, L35_2)
          L34_2 = string
          L34_2 = L34_2.byte
          L35_2 = L11_2.JobId
          L36_2 = 7
          L34_2 = L34_2(L35_2, L36_2)
          L35_2 = string
          L35_2 = L35_2.byte
          L36_2 = L11_2.JobId
          L37_2 = 9
          L38_2 = 16
          L35_2, L36_2, L37_2, L38_2 = L35_2(L36_2, L37_2, L38_2)
          L25_2 = L25_2(L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2)
          L26_2 = MpDetection
          L26_2 = L26_2.ReportResource
          L27_2 = "bitsjob"
          L28_2 = L25_2
          L29_2 = 3420
          L30_2 = false
          L31_2 = false
          L26_2(L27_2, L28_2, L29_2, L30_2, L31_2)
        end
      end
      ::lbl_341::
    end
    L17_2 = 1
    L18_2 = L11_2.JobType
    if L18_2 == L17_2 and L14_2 == true and L15_2 == true and L16_2 == true then
      L18_2 = string
      L18_2 = L18_2.format
      L19_2 = "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x"
      L20_2 = string
      L20_2 = L20_2.byte
      L21_2 = L11_2.JobId
      L22_2 = 4
      L20_2 = L20_2(L21_2, L22_2)
      L21_2 = string
      L21_2 = L21_2.byte
      L22_2 = L11_2.JobId
      L23_2 = 3
      L21_2 = L21_2(L22_2, L23_2)
      L22_2 = string
      L22_2 = L22_2.byte
      L23_2 = L11_2.JobId
      L24_2 = 2
      L22_2 = L22_2(L23_2, L24_2)
      L23_2 = string
      L23_2 = L23_2.byte
      L24_2 = L11_2.JobId
      L25_2 = 1
      L23_2 = L23_2(L24_2, L25_2)
      L24_2 = string
      L24_2 = L24_2.byte
      L25_2 = L11_2.JobId
      L26_2 = 6
      L24_2 = L24_2(L25_2, L26_2)
      L25_2 = string
      L25_2 = L25_2.byte
      L26_2 = L11_2.JobId
      L27_2 = 5
      L25_2 = L25_2(L26_2, L27_2)
      L26_2 = string
      L26_2 = L26_2.byte
      L27_2 = L11_2.JobId
      L28_2 = 8
      L26_2 = L26_2(L27_2, L28_2)
      L27_2 = string
      L27_2 = L27_2.byte
      L28_2 = L11_2.JobId
      L29_2 = 7
      L27_2 = L27_2(L28_2, L29_2)
      L28_2 = string
      L28_2 = L28_2.byte
      L29_2 = L11_2.JobId
      L30_2 = 9
      L31_2 = 16
      L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2 = L28_2(L29_2, L30_2, L31_2)
      L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2)
      L19_2 = MpDetection
      L19_2 = L19_2.ReportResource
      L20_2 = "bitsjob"
      L21_2 = L18_2
      L22_2 = 3482
      L23_2 = false
      L24_2 = false
      L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
    end
  end
  ::lbl_413::
end

Infrastructure_ScanBITSJobs = L0_1
