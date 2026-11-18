-- Threat: !InfrastructureShared
-- Name: !#SuspDLL_MutlExports1
-- Type: 10
-- MpAttributes: Lua:TopLevelUnsigned & pea_isdll & pea_hasexports & !pea_ismsil

local l_0_0 = mp.getfilesize()
if l_0_0 < 500000 or 30000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pe.get_exports()
if l_0_1 == nil or l_0_1 < 10 or 300 < l_0_1 then
  return mp.CLEAN
end
local l_0_3 = {}
local l_0_4 = {}

function addUniqueValue(l_1_0)
  if not l_0_4[l_1_0] then
    table.insert(l_0_3, l_1_0)
    l_0_4[l_1_0] = true
  end
end

for l_0_5 = 1, l_0_1 do
  addUniqueValue(l_0_2[l_0_5].rva)
end
if l_0_1 <= #l_0_3 + 3 then
  return mp.CLEAN
end
local l_0_6 = string.lower(mp.getfilename())
local l_0_7 = MpCommon.ExpandEnvironmentVariables("%windir%")
if l_0_7 == nil or l_0_7 == "" or string.find(l_0_6, string.lower(l_0_7), 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_8 = MpCommon.ExpandEnvironmentVariables("%programfiles(x86)%")
if l_0_8 == nil or l_0_8 == "" or string.find(l_0_6, string.lower(l_0_8), 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_9 = MpCommon.ExpandEnvironmentVariables("%programfiles%")
if l_0_9 == nil or l_0_9 == "" or string.find(l_0_6, string.lower(l_0_9), 1, true) ~= nil then
  return mp.CLEAN
end
if #l_0_3 == 1 then
  mp.set_mpattribute("Lua:AllExportsHasOneAddr")
elseif #l_0_3 == 2 then
  mp.set_mpattribute("Lua:ExportsHasTwoRVAOnly")
elseif l_0_1 > #l_0_3 * 2 then
  mp.set_mpattribute("Lua:MultiExportsShareRVA")
elseif l_0_1 > #l_0_3 + 3 then
  mp.set_mpattribute("Lua:FoundExportsShareRVA")
end
return mp.CLEAN
