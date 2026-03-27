-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPythonBase64StrDecodeB\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Lua:FileExtensionAttr!py") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 2097152 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = tostring((mp.readfile)(0, l_0_0))
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1:match("exec%([%w_]+%(%s*b\'([^\']+)\'%s*%)%)")
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_2:reverse()
local l_0_3 = (MpCommon.Base64Decode)(l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
;
(mp.vfo_add_buffer)("CWSHACK\000" .. l_0_3, "[PwsZlib]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN

