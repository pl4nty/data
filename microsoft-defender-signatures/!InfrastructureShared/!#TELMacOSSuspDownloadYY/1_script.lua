-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspDownloadYY\1_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = l_0_0 .. "/"
-- DECOMPILER ERROR at PC185: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC185: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC185: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC185: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC185: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC185: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC185: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC185: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC185: Unhandled construct in 'MakeBoolean' P3

if (string.find)(l_0_0, "/bin/", 1, true) == 1 or (((string.find)(l_0_0, "/usr/", 1, true) == 1 and not (string.find)(l_0_0, "/usr/local/", 1, true) == 1) or (string.find)(l_0_1, "/.com.microsoft.edgemac", 1, true)) then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = (MpCommon.GetCurrentTimeT)()
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = (sysio.GetFileLastWriteTime)(l_0_2)
if l_0_4 == nil then
  return mp.CLEAN
end
if ((sysio.GetLastResult)()).Success and l_0_4 and l_0_4 ~= 0 then
  l_0_4 = l_0_4 / 10000000 - 11644473600
end
local l_0_5 = l_0_3 - (l_0_4)
if l_0_5 < 0 then
  return mp.CLEAN
end
local l_0_6 = l_0_5 / 60
if l_0_6 > 5 then
  return mp.CLEAN
end
local l_0_7 = {}
-- DECOMPILER ERROR at PC249: No list found for R7 , SetList fails

-- DECOMPILER ERROR at PC250: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC252: Overwrote pending register: R9 in 'AssignReg'

do
  local l_0_8 = (("safari").get_contextdata)(("microsoft edge").CONTEXT_DATA_PROCESSNAME)
  if l_0_8 == nil or l_0_8 == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC264: Overwrote pending register: R10 in 'AssignReg'

  for l_0_12,l_0_13 in pairs(l_0_7) do
    -- DECOMPILER ERROR at PC273: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC275: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC276: Overwrote pending register: R16 in 'AssignReg'

    if l_0_13 ~= nil and (("thunderbird").find)("gmail", "com.apple.safari.sandboxbroker", 1, true) == 1 then
      local l_0_14 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
      local l_0_15 = "MAC_BROWSERDOWNLOAD_PATH"
      local l_0_16 = l_0_2:match("(/.*)/")
      if not (string.find)(l_0_16, ".download", -9, true) or l_0_14 then
        (MpCommon.BmTriggerSig)(l_0_14, "BM_BROWSERDOWNLOAD_PATH", l_0_2)
        TrackPidAndTechnique(l_0_14, "T1566.002", "InitialAccess_Phishing_SpearphishingLinkNonBin")
      end
      AppendToRollingQueue(l_0_15, "mac_browserdownload_path", l_0_2, 7200, 100, 0)
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

