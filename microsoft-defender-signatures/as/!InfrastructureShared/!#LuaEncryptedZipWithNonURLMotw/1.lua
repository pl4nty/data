local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_HAS_MOTW_ADS
L1_1 = L1_1(L2_1)
if L1_1 == true then
  L1_1 = mp
  L1_1 = L1_1.GetMOTWHostUrl
  L1_1 = L1_1()
  L0_1 = L1_1
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.lower
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "about:"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
  L1_1 = L1_1(L2_1)
  if L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L3_1 = L1_1
  L2_1 = L1_1.lower
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = {}
  L3_1 = "chrome.exe"
  L4_1 = "firefox.exe"
  L5_1 = "opera.exe"
  L6_1 = "msedge.exe"
  L7_1 = "brave.exe"
  L2_1[1] = L3_1
  L2_1[2] = L4_1
  L2_1[3] = L5_1
  L2_1[4] = L6_1
  L2_1[5] = L7_1
  L3_1 = contains
  L4_1 = L1_1
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.getfilename
    L4_1 = mp
    L4_1 = L4_1.bitor
    L5_1 = mp
    L5_1 = L5_1.FILEPATH_QUERY_FULL
    L6_1 = mp
    L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
    L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L4_1(L5_1, L6_1)
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
    if L3_1 == nil then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = mp
    L4_1 = L4_1.get_contextdata
    L5_1 = mp
    L5_1 = L5_1.CONTEXT_DATA_PROCESSDEVICEPATH
    L4_1 = L4_1(L5_1)
    L5_1 = mp
    L5_1 = L5_1.get_contextdata
    L6_1 = mp
    L6_1 = L6_1.CONTEXT_DATA_PROCESS_PPID
    L5_1 = L5_1(L6_1)
    L6_1 = MpCommon
    L6_1 = L6_1.PathToWin32Path
    L7_1 = L4_1
    L6_1 = L6_1(L7_1)
    L4_1 = L6_1
    if L4_1 ~= nil and L5_1 ~= nil then
      L7_1 = L4_1
      L6_1 = L4_1.lower
      L6_1 = L6_1(L7_1)
      L4_1 = L6_1
      L6_1 = MpCommon
      L6_1 = L6_1.GetCurrentTimeT
      L6_1 = L6_1()
      L7_1 = "WARCH::ProcessImagePath="
      L8_1 = L4_1
      L9_1 = ";pid="
      L10_1 = L5_1
      L11_1 = ";timestamp="
      L12_1 = L6_1
      L13_1 = ";motw="
      L14_1 = L0_1
      L7_1 = L7_1 .. L8_1 .. L9_1 .. L10_1 .. L11_1 .. L12_1 .. L13_1 .. L14_1
      L8_1 = IsKeyInRollingQueue
      L9_1 = "CC_filelist"
      L10_1 = L3_1
      L8_1 = L8_1(L9_1, L10_1)
      if not L8_1 then
        L8_1 = 31536000
        L9_1 = AppendToRollingQueue
        L10_1 = "CC_filelist"
        L11_1 = L3_1
        L12_1 = L7_1
        L13_1 = L8_1
        L14_1 = 32
        L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
      end
    end
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
