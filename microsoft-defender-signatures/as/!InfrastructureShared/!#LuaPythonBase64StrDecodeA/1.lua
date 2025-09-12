-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPythonBase64StrDecodeA\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Lua:FileExtensionAttr!pyd") and not (mp.get_mpattribute)("Lua:FileExtensionAttr!py") then
  return mp.CLEAN
end
if (mp.get_mpattributesubstring)("PACKED_WITH:[Base64Decode]") then
  return mp.CLEAN
end
local l_0_0 = (mp.get_mpattributevalue)("SCRIPT:Base64StrStart.A")
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilesize)()
if l_0_1 > 20480 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_2 = tostring((mp.readfile)(l_0_0, l_0_1 - l_0_0))
local l_0_3 = (string.match)(l_0_2, "([a-zA-Z0-9%+/]+=?=?)")
if l_0_3 == nil then
  return mp.CLEAN
end
;
(mp.vfo_add_buffer)(l_0_3, "[Base64Decode]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN

