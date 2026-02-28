local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1)
if L1_1 == "svchost.exe" then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_PROCESS_PPID
  L1_1 = L1_1(L2_1)
  L2_1 = mp
  L2_1 = L2_1.GetProcessCommandLine
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.len
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if L3_1 ~= 0 then
      goto lbl_43
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  do return L3_1 end
  ::lbl_43::
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L2_1
  L6_1 = "-s%s+([^%s]+)"
  L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1 = L4_1(L5_1, L6_1)
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1)
  if L3_1 ~= "bits" then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
else
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_FILENAME
  L1_1 = L1_1(L2_1)
  if L1_1 ~= "sumagar_test.goforit" then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = sysio
L1_1 = L1_1.EnumerateBitsJobs
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = {}
L4_1 = 0
L5_1 = nil
L6_1 = nil
L7_1 = MpCommon
L7_1 = L7_1.GetPersistContextCountNoPath
L8_1 = "urlsFromBitsJobs"
L7_1 = L7_1(L8_1)
L8_1 = {}
if 0 < L7_1 then
  L9_1 = MpCommon
  L9_1 = L9_1.GetPersistContextNoPath
  L10_1 = "urlsFromBitsJobs"
  L9_1 = L9_1(L10_1)
  L8_1 = L9_1
end
L3_1.SIG_CONTEXT = "LUA_GENERIC"
L3_1.CONTENT_SOURCE = "BITS"
L3_1.PROCESS_CONTEXT = "SVCHOST.EXE"
L3_1.PARENT_CONTEXT = nil
L3_1.FILELESS = "true"
L3_1.CMDLINE_URL = "false"
L3_1.BREAK_AT_FIRST_HIT_MALWARE = "40"
L9_1 = false
L10_1 = nil
L11_1 = pairs
L12_1 = L1_1
L11_1, L12_1, L13_1 = L11_1(L12_1)
for L14_1, L15_1 in L11_1, L12_1, L13_1 do
  L16_1 = string
  L16_1 = L16_1.sub
  L17_1 = L15_1.JobName
  L18_1 = 1
  L19_1 = 10
  L16_1 = L16_1(L17_1, L18_1, L19_1)
  if L16_1 ~= "CCMDTS Job" then
    if 256 <= L7_1 then
      break
    end
    if 30 <= L4_1 then
      break
    end
    L16_1 = string
    L16_1 = L16_1.format
    L17_1 = "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x"
    L18_1 = string
    L18_1 = L18_1.byte
    L19_1 = L15_1.JobId
    L20_1 = 4
    L18_1 = L18_1(L19_1, L20_1)
    L19_1 = string
    L19_1 = L19_1.byte
    L20_1 = L15_1.JobId
    L21_1 = 3
    L19_1 = L19_1(L20_1, L21_1)
    L20_1 = string
    L20_1 = L20_1.byte
    L21_1 = L15_1.JobId
    L22_1 = 2
    L20_1 = L20_1(L21_1, L22_1)
    L21_1 = string
    L21_1 = L21_1.byte
    L22_1 = L15_1.JobId
    L23_1 = 1
    L21_1 = L21_1(L22_1, L23_1)
    L22_1 = string
    L22_1 = L22_1.byte
    L23_1 = L15_1.JobId
    L24_1 = 6
    L22_1 = L22_1(L23_1, L24_1)
    L23_1 = string
    L23_1 = L23_1.byte
    L24_1 = L15_1.JobId
    L25_1 = 5
    L23_1 = L23_1(L24_1, L25_1)
    L24_1 = string
    L24_1 = L24_1.byte
    L25_1 = L15_1.JobId
    L26_1 = 8
    L24_1 = L24_1(L25_1, L26_1)
    L25_1 = string
    L25_1 = L25_1.byte
    L26_1 = L15_1.JobId
    L27_1 = 7
    L25_1 = L25_1(L26_1, L27_1)
    L26_1 = string
    L26_1 = L26_1.byte
    L27_1 = L15_1.JobId
    L28_1 = 9
    L29_1 = 16
    L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1 = L26_1(L27_1, L28_1, L29_1)
    L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1)
    L17_1 = string
    L17_1 = L17_1.lower
    L18_1 = L15_1.NotifyCmdProgramParam
    L17_1 = L17_1(L18_1)
    if L17_1 ~= "" and L17_1 ~= nil then
      L18_1 = string
      L18_1 = L18_1.gmatch
      L19_1 = L17_1
      L20_1 = "http[s]?:[^%s\"']+"
      L18_1, L19_1, L20_1 = L18_1(L19_1, L20_1)
      for L21_1 in L18_1, L19_1, L20_1 do
        if 0 < L7_1 then
          L22_1 = ipairs
          L23_1 = L8_1
          L22_1, L23_1, L24_1 = L22_1(L23_1)
          for L25_1, L26_1 in L22_1, L23_1, L24_1 do
            if L21_1 == L26_1 then
              L21_1 = nil
              break
            end
          end
        end
        if L21_1 ~= nil then
          L22_1 = mp
          L22_1 = L22_1.CheckUrl
          L23_1 = L21_1
          L22_1, L23_1 = L22_1(L23_1)
          if L22_1 == 0 or L22_1 == 1 and L23_1 == 0 then
            L4_1 = L4_1 + 1
            if 30 < L4_1 then
              break
            end
            L7_1 = L7_1 + 1
            if 256 < L7_1 then
              break
            end
            L24_1 = table
            L24_1 = L24_1.insert
            L25_1 = L2_1
            L26_1 = L4_1
            L27_1 = L21_1
            L24_1(L25_1, L26_1, L27_1)
            L24_1 = L16_1
            L25_1 = "<$>"
            L26_1 = string
            L26_1 = L26_1.sub
            L27_1 = L15_1.JobName
            L28_1 = 1
            L29_1 = 32
            L26_1 = L26_1(L27_1, L28_1, L29_1)
            L27_1 = "<$>"
            L28_1 = L15_1.JobType
            L29_1 = "<$>"
            L30_1 = L15_1.JobRetryDelay
            L31_1 = "<$>"
            L32_1 = L15_1.JobNoProgressTimeout
            L33_1 = "<$>"
            L34_1 = L15_1.JobLastError
            L35_1 = "<$>"
            L36_1 = L15_1.JobLastErrorContext
            L37_1 = "<$>"
            L38_1 = string
            L38_1 = L38_1.sub
            L39_1 = L15_1.NotifyCmdProgram
            L40_1 = 1
            L41_1 = 64
            L38_1 = L38_1(L39_1, L40_1, L41_1)
            L39_1 = "<$>"
            L40_1 = string
            L40_1 = L40_1.sub
            L41_1 = L15_1.NotifyCmdProgramParam
            L42_1 = 1
            L43_1 = 128
            L40_1 = L40_1(L41_1, L42_1, L43_1)
            L6_1 = L24_1 .. L25_1 .. L26_1 .. L27_1 .. L28_1 .. L29_1 .. L30_1 .. L31_1 .. L32_1 .. L33_1 .. L34_1 .. L35_1 .. L36_1 .. L37_1 .. L38_1 .. L39_1 .. L40_1
            L24_1 = tostring
            L25_1 = L4_1
            L24_1 = L24_1(L25_1)
            L5_1 = L24_1
            L3_1[L5_1] = L6_1
            L24_1 = table
            L24_1 = L24_1.insert
            L25_1 = L8_1
            L26_1 = L21_1
            L24_1(L25_1, L26_1)
            L24_1 = MpCommon
            L24_1 = L24_1.AppendPersistContextNoPath
            L25_1 = "urlsFromBitsJobs"
            L26_1 = L21_1
            L27_1 = 0
            L24_1(L25_1, L26_1, L27_1)
          end
        end
      end
      L18_1 = string
      L18_1 = L18_1.gmatch
      L19_1 = L17_1
      L20_1 = "ftp[s]?:[^%s\"']+"
      L18_1, L19_1, L20_1 = L18_1(L19_1, L20_1)
      for L21_1 in L18_1, L19_1, L20_1 do
        if 0 < L7_1 then
          L22_1 = ipairs
          L23_1 = L8_1
          L22_1, L23_1, L24_1 = L22_1(L23_1)
          for L25_1, L26_1 in L22_1, L23_1, L24_1 do
            if L21_1 == L26_1 then
              L21_1 = nil
              break
            end
          end
        end
        if L21_1 ~= nil then
          L22_1 = mp
          L22_1 = L22_1.CheckUrl
          L23_1 = L21_1
          L22_1 = L22_1(L23_1)
          if L22_1 ~= 0 then
            L22_1 = mp
            L22_1 = L22_1.CheckUrl
            L23_1 = L21_1
            L22_1, L23_1 = L22_1(L23_1)
            if L22_1 == 0 or L22_1 == 1 and L23_1 == 0 then
              L4_1 = L4_1 + 1
              if 30 < L4_1 then
                break
              end
              L7_1 = L7_1 + 1
              if 256 < L7_1 then
                break
              end
              L24_1 = table
              L24_1 = L24_1.insert
              L25_1 = L2_1
              L26_1 = L4_1
              L27_1 = L21_1
              L24_1(L25_1, L26_1, L27_1)
              L24_1 = L16_1
              L25_1 = "<$>"
              L26_1 = string
              L26_1 = L26_1.sub
              L27_1 = L15_1.JobName
              L28_1 = 1
              L29_1 = 32
              L26_1 = L26_1(L27_1, L28_1, L29_1)
              L27_1 = "<$>"
              L28_1 = L15_1.JobType
              L29_1 = "<$>"
              L30_1 = L15_1.JobRetryDelay
              L31_1 = "<$>"
              L32_1 = L15_1.JobNoProgressTimeout
              L33_1 = "<$>"
              L34_1 = L15_1.JobLastError
              L35_1 = "<$>"
              L36_1 = L15_1.JobLastErrorContext
              L37_1 = "<$>"
              L38_1 = string
              L38_1 = L38_1.sub
              L39_1 = L15_1.NotifyCmdProgram
              L40_1 = 1
              L41_1 = 64
              L38_1 = L38_1(L39_1, L40_1, L41_1)
              L39_1 = "<$>"
              L40_1 = string
              L40_1 = L40_1.sub
              L41_1 = L15_1.NotifyCmdProgramParam
              L42_1 = 1
              L43_1 = 128
              L40_1 = L40_1(L41_1, L42_1, L43_1)
              L6_1 = L24_1 .. L25_1 .. L26_1 .. L27_1 .. L28_1 .. L29_1 .. L30_1 .. L31_1 .. L32_1 .. L33_1 .. L34_1 .. L35_1 .. L36_1 .. L37_1 .. L38_1 .. L39_1 .. L40_1
              L24_1 = tostring
              L25_1 = L4_1
              L24_1 = L24_1(L25_1)
              L5_1 = L24_1
              L3_1[L5_1] = L6_1
              L24_1 = table
              L24_1 = L24_1.insert
              L25_1 = L8_1
              L26_1 = L21_1
              L24_1(L25_1, L26_1)
              L24_1 = MpCommon
              L24_1 = L24_1.AppendPersistContextNoPath
              L25_1 = "urlsFromBitsJobs"
              L26_1 = L21_1
              L27_1 = 0
              L24_1(L25_1, L26_1, L27_1)
            end
          end
        end
      end
    end
    L18_1 = L15_1.JobFiles
    if L18_1 ~= nil then
      L18_1 = ipairs
      L19_1 = L15_1.JobFiles
      L18_1, L19_1, L20_1 = L18_1(L19_1)
      for L21_1, L22_1 in L18_1, L19_1, L20_1 do
        L23_1 = string
        L23_1 = L23_1.find
        L24_1 = string
        L24_1 = L24_1.lower
        L25_1 = string
        L25_1 = L25_1.sub
        L26_1 = L22_1.FileLocalName
        L27_1 = 1
        L28_1 = 32
        L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1 = L25_1(L26_1, L27_1, L28_1)
        L24_1 = L24_1(L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1)
        L25_1 = "\\windows\\ccm\\"
        L26_1 = 1
        L27_1 = true
        L23_1 = L23_1(L24_1, L25_1, L26_1, L27_1)
        if L23_1 == nil then
          L23_1 = string
          L23_1 = L23_1.lower
          L24_1 = L22_1.FileRemoteName
          L23_1 = L23_1(L24_1)
          if L23_1 ~= "" and L23_1 ~= nil then
            L24_1 = MpCommon
            L24_1 = L24_1.StringRegExpSearch
            L25_1 = "[\"]?((http[s]?|ftp[s]?):[^\\s\"']+)[\"]?"
            L26_1 = L23_1
            L24_1, L25_1 = L24_1(L25_1, L26_1)
            L10_1 = L25_1
            L9_1 = L24_1
            if L9_1 == true and L10_1 ~= "" and L10_1 ~= nil then
              if 0 < L7_1 then
                L24_1 = ipairs
                L25_1 = L8_1
                L24_1, L25_1, L26_1 = L24_1(L25_1)
                for L27_1, L28_1 in L24_1, L25_1, L26_1 do
                  if L10_1 == L28_1 then
                    L10_1 = nil
                    break
                  end
                end
              end
              if L10_1 ~= nil then
                L24_1 = mp
                L24_1 = L24_1.CheckUrl
                L25_1 = L10_1
                L24_1, L25_1 = L24_1(L25_1)
                if L24_1 == 0 or L24_1 == 1 and L25_1 == 0 then
                  L4_1 = L4_1 + 1
                  if 30 < L4_1 then
                    break
                  end
                  L7_1 = L7_1 + 1
                  if 256 < L7_1 then
                    break
                  end
                  L26_1 = table
                  L26_1 = L26_1.insert
                  L27_1 = L2_1
                  L28_1 = L4_1
                  L29_1 = L10_1
                  L26_1(L27_1, L28_1, L29_1)
                  L26_1 = L16_1
                  L27_1 = "<$>"
                  L28_1 = string
                  L28_1 = L28_1.sub
                  L29_1 = L15_1.JobName
                  L30_1 = 1
                  L31_1 = 32
                  L28_1 = L28_1(L29_1, L30_1, L31_1)
                  L29_1 = "<$>"
                  L30_1 = L15_1.JobType
                  L31_1 = "<$>"
                  L32_1 = L15_1.JobRetryDelay
                  L33_1 = "<$>"
                  L34_1 = L15_1.JobNoProgressTimeout
                  L35_1 = "<$>"
                  L36_1 = L15_1.JobLastError
                  L37_1 = "<$>"
                  L38_1 = L15_1.JobLastErrorContext
                  L39_1 = "<$>"
                  L40_1 = string
                  L40_1 = L40_1.sub
                  L41_1 = L15_1.NotifyCmdProgram
                  L42_1 = 1
                  L43_1 = 64
                  L40_1 = L40_1(L41_1, L42_1, L43_1)
                  L41_1 = "<$>"
                  L42_1 = string
                  L42_1 = L42_1.sub
                  L43_1 = L15_1.NotifyCmdProgramParam
                  L44_1 = 1
                  L45_1 = 128
                  L42_1 = L42_1(L43_1, L44_1, L45_1)
                  L43_1 = "<$>"
                  L44_1 = string
                  L44_1 = L44_1.sub
                  L45_1 = L22_1.FileLocalName
                  L46_1 = 1
                  L47_1 = 128
                  L44_1 = L44_1(L45_1, L46_1, L47_1)
                  L45_1 = "<$>"
                  L46_1 = string
                  L46_1 = L46_1.sub
                  L47_1 = L22_1.FileRemoteName
                  L48_1 = 1
                  L49_1 = 256
                  L46_1 = L46_1(L47_1, L48_1, L49_1)
                  L6_1 = L26_1 .. L27_1 .. L28_1 .. L29_1 .. L30_1 .. L31_1 .. L32_1 .. L33_1 .. L34_1 .. L35_1 .. L36_1 .. L37_1 .. L38_1 .. L39_1 .. L40_1 .. L41_1 .. L42_1 .. L43_1 .. L44_1 .. L45_1 .. L46_1
                  L26_1 = tostring
                  L27_1 = L4_1
                  L26_1 = L26_1(L27_1)
                  L5_1 = L26_1
                  L3_1[L5_1] = L6_1
                  L26_1 = table
                  L26_1 = L26_1.insert
                  L27_1 = L8_1
                  L28_1 = L10_1
                  L26_1(L27_1, L28_1)
                  L26_1 = MpCommon
                  L26_1 = L26_1.AppendPersistContextNoPath
                  L27_1 = "urlsFromBitsJobs"
                  L28_1 = L10_1
                  L29_1 = 0
                  L26_1(L27_1, L28_1, L29_1)
                end
              end
            end
          end
        end
      end
    end
  end
end
if L4_1 == 0 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
else
  L11_1 = #L2_1
  if L11_1 == 0 then
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    return L11_1
  end
end
L11_1 = mp
L11_1 = L11_1.ReportLowfi
L12_1 = mp
L12_1 = L12_1.getfilename
L12_1 = L12_1()
L13_1 = 4272609966
L11_1(L12_1, L13_1)
L11_1 = mp
L11_1 = L11_1.GetUrlReputation
L12_1 = L2_1
L13_1 = L3_1
L11_1 = L11_1(L12_1, L13_1)
if L11_1 ~= nil then
  L12_1 = mp
  L12_1 = L12_1.ReportLowfi
  L13_1 = mp
  L13_1 = L13_1.getfilename
  L13_1 = L13_1()
  L14_1 = 1738771220
  L12_1(L13_1, L14_1)
  L12_1 = L11_1.urls
  L13_1 = ipairs
  L14_1 = L12_1
  L13_1, L14_1, L15_1 = L13_1(L14_1)
  for L16_1, L17_1 in L13_1, L14_1, L15_1 do
    L18_1 = nil
    L19_1 = ipairs
    L20_1 = L2_1
    L19_1, L20_1, L21_1 = L19_1(L20_1)
    for L22_1, L23_1 in L19_1, L20_1, L21_1 do
      L24_1 = L17_1.url
      if L23_1 == L24_1 then
        L24_1 = tostring
        L25_1 = L22_1
        L24_1 = L24_1(L25_1)
        L18_1 = L24_1
      end
    end
    if L18_1 == nil then
      L19_1 = mp
      L19_1 = L19_1.CLEAN
      return L19_1
    end
    L19_1 = string
    L19_1 = L19_1.match
    L20_1 = L3_1[L18_1]
    L21_1 = "(.-)<$>"
    L19_1 = L19_1(L20_1, L21_1)
    L20_1 = L17_1.determination
    if L20_1 == 2 then
      L20_1 = MpCommon
      L20_1 = L20_1.ReportFilelessResource
      L21_1 = "bitsjob"
      L22_1 = L19_1
      L23_1 = 4245
      L20_1(L21_1, L22_1, L23_1)
    else
      L20_1 = L17_1.determination
      if L20_1 == 3 then
        L20_1 = MpCommon
        L20_1 = L20_1.ReportFilelessResource
        L21_1 = "bitsjob"
        L22_1 = L19_1
        L23_1 = 4246
        L20_1(L21_1, L22_1, L23_1)
      else
        L20_1 = L17_1.determination
        if L20_1 == 4 then
          L20_1 = MpCommon
          L20_1 = L20_1.ReportFilelessResource
          L21_1 = "bitsjob"
          L22_1 = L19_1
          L23_1 = 4247
          L20_1(L21_1, L22_1, L23_1)
          L20_1 = mp
          L20_1 = L20_1.INFECTED
          return L20_1
        end
      end
    end
  end
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
