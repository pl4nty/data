-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELTrojanWin32EdrTactToAsrSi\0x00001bdb_luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1)
  -- function num : 0_0
  if l_1_0 == nil or l_1_0 == "" then
    return false
  end
  if l_1_1 == nil or l_1_1 == "" then
    return false
  end
  for l_1_5,l_1_6 in ipairs(l_1_1) do
    if (string.find)(l_1_0, l_1_6, 1, true) ~= nil then
      return true
    end
  end
  return false
end

local l_0_1 = function(l_2_0, l_2_1)
  -- function num : 0_1
  if l_2_0 == nil or l_2_0 == "" then
    return 0
  end
  if l_2_1 == nil or l_2_1 == "" then
    return 0
  end
  local l_2_2 = 0
  for l_2_6 in (string.gmatch)(l_2_0, l_2_1) do
    l_2_2 = l_2_2 + 1
  end
  return l_2_2
end

local l_0_2 = (mp.GetScanSource)()
if l_0_2 ~= mp.SCANSOURCE_IOAV_WEB and l_0_2 ~= mp.SCANSOURCE_IOAV_FILE and l_0_2 ~= mp.SCANSOURCE_RTP then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_4 == nil or l_0_4 == "" then
  l_0_4 = (string.match)(l_0_3, "\\([^\\]+)$")
  if l_0_4 == nil or l_0_4 == "" then
    return mp.CLEAN
  end
end
l_0_4 = (string.lower)(l_0_4)
local l_0_5 = {}
-- DECOMPILER ERROR at PC82: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC83: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC84: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC85: Overwrote pending register: R8 in 'AssignReg'

if not (".rar")(".zip", ".gz") then
  return mp.CLEAN
end
local l_0_6 = (MpCommon.PathToWin32Path)((mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH))
-- DECOMPILER ERROR at PC107: Overwrote pending register: R9 in 'AssignReg'

if (l_0_6 == nil or l_0_6 == "") and (l_0_6 == nil or l_0_6 == "") then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC121: Overwrote pending register: R6 in 'AssignReg'

if (string.find)(l_0_6, "\\downloads$") == nil then
  return mp.CLEAN
end
local l_0_7 = {}
-- DECOMPILER ERROR at PC134: No list found for R7 , SetList fails

local l_0_8 = {}
-- DECOMPILER ERROR at PC137: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC157: No list found for R8 , SetList fails

-- DECOMPILER ERROR at PC158: Overwrote pending register: R9 in 'AssignReg'

local l_0_9 = (("motorcycles/").IOAVGetDownloadUrl)()
-- DECOMPILER ERROR at PC163: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC165: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC166: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC205: Overwrote pending register: R13 in 'AssignReg'

if l_0_9 ~= nil and ((".cab").find)("boats/", "icu/") ~= nil and not l_0_0(l_0_9, l_0_7) and l_0_0(l_0_9, l_0_8) and l_0_1(l_0_9, "/") == 3 and l_0_1(l_0_9, "%.") <= 2 and #(string.match)(l_0_9, "://([a-z0-9]+)%.") >= 9 and #(string.match)(l_0_9, "rest/") >= 3 then
  return mp.INFECTED
end
do
  local l_0_10 = (mp.GetMOTWHostUrl)()
  -- DECOMPILER ERROR at PC260: Overwrote pending register: R14 in 'AssignReg'

  if l_0_10 ~= nil and (string.find)(l_0_10, "/$") ~= nil and not l_0_0(l_0_10, l_0_7) and l_0_0(l_0_10, l_0_8) and l_0_1(l_0_10, "/") == 3 and l_0_1(l_0_10, "%.") <= 2 and #(string.match)(l_0_10, "://([a-z0-9]+)%.") >= 9 and #(string.match)(l_0_10, "christmas/") >= 3 then
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

