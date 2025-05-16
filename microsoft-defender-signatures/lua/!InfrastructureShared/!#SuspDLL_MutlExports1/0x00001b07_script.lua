-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SuspDLL_MutlExports1\0x00001b07_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 500000 or l_0_0 > 30000000 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (pe.get_exports)()
if l_0_1 == nil or l_0_1 < 10 or l_0_1 > 300 then
  return mp.CLEAN
end
local l_0_3 = {}
local l_0_4 = {}
addUniqueValue = function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_4, l_0_3
  if not l_0_4[l_1_0] then
    (table.insert)(l_0_3, l_1_0)
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

    l_0_4[l_1_0] = true
  end
end

for l_0_8 = 1, l_0_1 do
  addUniqueValue((l_0_2[l_0_8]).rva)
end
if l_0_1 <= #l_0_3 + 3 then
  return mp.CLEAN
end
local l_0_9 = (string.lower)((mp.getfilename)())
local l_0_10 = (MpCommon.ExpandEnvironmentVariables)("%windir%")
if l_0_10 == nil or l_0_10 == "" or (string.find)(l_0_9, (string.lower)(l_0_10), 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_11 = (MpCommon.ExpandEnvironmentVariables)("%programfiles(x86)%")
if l_0_11 == nil or l_0_11 == "" or (string.find)(l_0_9, (string.lower)(l_0_11), 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_12 = (MpCommon.ExpandEnvironmentVariables)("%programfiles%")
if l_0_12 == nil or l_0_12 == "" or (string.find)(l_0_9, (string.lower)(l_0_12), 1, true) ~= nil then
  return mp.CLEAN
end
if #l_0_3 == 1 then
  (mp.set_mpattribute)("Lua:AllExportsHasOneAddr")
else
  if #l_0_3 == 2 then
    (mp.set_mpattribute)("Lua:ExportsHasTwoRVAOnly")
  else
    if #l_0_3 * 2 < l_0_1 then
      (mp.set_mpattribute)("Lua:MultiExportsShareRVA")
    else
      if #l_0_3 + 3 < l_0_1 then
        (mp.set_mpattribute)("Lua:FoundExportsShareRVA")
      end
    end
  end
end
return mp.CLEAN

