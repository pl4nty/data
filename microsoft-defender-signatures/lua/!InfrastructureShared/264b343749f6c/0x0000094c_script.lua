-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\264b343749f6c\0x0000094c_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = GetRealPidForScenario(l_0_0.ppid)
local l_0_2 = l_0_0.command_line
local l_0_3 = GetTacticsTableForPid(l_0_1)
local l_0_4 = GetTechniquesTableForPid(l_0_1)
local l_0_5 = GetTacticsTableGlobal()
if l_0_3 == nil or l_0_4 == nil or l_0_5 == nil or type(l_0_3) ~= "table" or type(l_0_4) ~= "table" or type(l_0_5) ~= "table" then
  return mp.CLEAN
end
if l_0_2 ~= nil and l_0_2 ~= "" and ((string.find)(l_0_2, "/Library/Application Support/JAMF/Jamf.app/", 1, true) or (string.find)(l_0_2, "/usr/local/jamf/bin/jamf", 1, true) or (string.find)(l_0_2, "GoogleUpdater --server", 1, true) or (string.find)(l_0_2, "GoogleUpdater --install", 1, true) or (string.find)(l_0_2, "/sbin/launchd", 1, true) or not (string.find)(l_0_2, "/Applications/Visual Studio Code", 1, true) or (string.find)(l_0_2, "/Contents/MacOS/Electron", 1, true)) then
  return mp.CLEAN
end
isKeyInTable = function(l_1_0, l_1_1)
  -- function num : 0_0
  for l_1_5,l_1_6 in pairs(l_1_1) do
    if l_1_5 == l_1_0 then
      return true
    end
  end
  return false
end

local l_0_6 = {}
for l_0_10,l_0_11 in pairs(l_0_3) do
  if l_0_10 ~= "DefenseEvasion_Masquerading" then
    local l_0_12 = l_0_10:match("([^_]+)_")
    if l_0_12 then
      l_0_12 = (string.lower)(l_0_12)
      if l_0_6[l_0_12] == nil then
        l_0_6[l_0_12] = 1
      else
        l_0_6[l_0_12] = l_0_6[l_0_12] + 1
      end
    end
  end
end
getTacticCount = function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_6
  do
    if l_0_6[l_2_0] ~= nil then
      local l_2_1 = l_0_6[l_2_0]
      if l_2_1 ~= nil and l_2_1 ~= "" and l_2_1 > 0 then
        return l_2_1
      end
    end
    return 0
  end
end

AddResearchData(l_0_1, true)
reportRelatedBmHits()
-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC362: Unhandled construct in 'MakeBoolean' P3

if getTacticCount("discovery") > 3 or ((getTacticCount("discovery") > 0 and getTacticCount("collection") > 0 and getTacticCount("exfiltration") > 0 and isKeyInTable("Collection_DatafromLocalSystem", l_0_3)) or getTacticCount("execution") <= 0 or getTacticCount("privilegeescalation") <= 0 or getTacticCount("defenseevasion") <= 1 or getTacticCount("discovery") <= 0 or getTacticCount("discovery") <= 0 or getTacticCount("collection") <= 0 or getTacticCount("execution") <= 0 or getTacticCount("privilegeescalation") <= 0 or isKeyInTable("DefenseEvasion_FileAndDirectoryPermissionsModification_Curl", l_0_3) or not isKeyInTable("CommandAndControl_IngressToolTransfer_withCurl", l_0_3) or isKeyInTable("DefenseEvasion_HiddenFilesandDirectories", l_0_3) or not isKeyInTable("Execution_CommandandScriptingInterpreter_Python", l_0_3) or not isKeyInTable("Execution_CommandandScriptingInterpreter_Python", l_0_3) or not isKeyInTable("Discovery_FileAndDirectoryDiscovery_mdfind", l_0_3) or getTacticCount("execution") <= 0 or getTacticCount("privilegeescalation") <= 0 or getTacticCount("discovery") <= 2 or getTacticCount("discovery") <= 1 or isKeyInTable("CommandAndControl_ProtocolTunneling_HTTPSoverNonStandardPort", l_0_3)) then
  return mp.INFECTED
end
return mp.CLEAN

