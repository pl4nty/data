-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspDownloadX\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = l_0_1 .. "/"
-- DECOMPILER ERROR at PC195: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC195: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC195: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC195: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC195: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC195: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC195: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC195: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC195: Unhandled construct in 'MakeBoolean' P3

if (string.find)(l_0_1, "/bin/", 1, true) == 1 or (((string.find)(l_0_1, "/usr/", 1, true) == 1 and not (string.find)(l_0_1, "/usr/local/", 1, true) == 1) or (string.find)(l_0_2, ".com.microsoft.edgemac", 1, true)) then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_3, "->(MachO-UniBin-", 1, true) then
  l_0_3 = l_0_3:gsub("%->%(MachO%-UniBin%-.*", "")
end
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC235: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC236: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC238: Overwrote pending register: R6 in 'AssignReg'

  local l_0_5 = (("safari").get_contextdata)(("microsoft edge").CONTEXT_DATA_PROCESSNAME)
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC250: Overwrote pending register: R7 in 'AssignReg'

  for l_0_9,l_0_10 in pairs(l_0_4) do
    -- DECOMPILER ERROR at PC259: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC261: Overwrote pending register: R12 in 'AssignReg'

    if l_0_10 ~= nil and (("thunderbird").find)("gmail", l_0_10, 1, true) == 1 then
      (mp.set_mpattribute)("BM_MACFILE_DOWNLOADFROM_BROWSEREMAIL")
      local l_0_11 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
      local l_0_12 = "MAC_BROWSERDOWNLOAD_PATH"
      local l_0_13 = (mp.GetCertificateInfo)()
      if #l_0_13 < 1 or l_0_13 == nil then
        if l_0_11 then
          (MpCommon.BmTriggerSig)(l_0_11, "BM_MACFILE_DOWNLOADFROM_BROWSEREMAIL", l_0_3)
          TrackPidAndTechnique(l_0_11, "T1566.002", "InitialAccess_Phishing_SpearphishingLink")
        end
        AppendToRollingQueue(l_0_12, "mac_browserdownload_path", l_0_3, 7200, 100, 0)
        return mp.INFECTED
      end
    end
  end
end
do
  do
    -- DECOMPILER ERROR at PC313: Overwrote pending register: R4 in 'AssignReg'

    do return l_0_4 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

