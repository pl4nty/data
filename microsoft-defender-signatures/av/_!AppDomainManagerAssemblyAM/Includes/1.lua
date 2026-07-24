-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!AppDomainManagerAssemblyAM\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = normalize_path(l_0_0)
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.ExpandEnvironmentVariables)("%windir%")
if not isnull(l_0_1) then
  l_0_1 = normalize_path(l_0_1)
  if not isnull(l_0_1) and (string.sub)(l_0_0, 1, #l_0_1 + 1) == l_0_1 .. "\\" and (string.sub)(l_0_0, 1, #l_0_1 + 6) ~= l_0_1 .. "\\temp\\" then
    return mp.CLEAN
  end
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC84: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC85: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC86: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ((MpCommon.ExpandEnvironmentVariables)("%ProgramFiles%"))((MpCommon.ExpandEnvironmentVariables)("%ProgramFiles(x86)%")) do
  if not isnull(l_0_7) then
    local l_0_8 = normalize_path(l_0_7)
    if not isnull(l_0_8) and (string.sub)(l_0_0, 1, #l_0_8 + 1) == l_0_8 .. "\\" then
      return mp.CLEAN
    end
  end
end
local l_0_9 = "AppDomainManagerRelationAM"
local l_0_10 = "PendingAssemblies"
local l_0_11 = "RecentAssemblies"
local l_0_12 = 1800
AppendToRollingQueueNamespaced(l_0_11, l_0_9, l_0_0, 1, l_0_12, 256, 1)
local l_0_13, l_0_14 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_0_10, l_0_9, l_0_0)
if not l_0_13 or isnull(l_0_14) then
  return mp.CLEAN
end
return mp.INFECTED

