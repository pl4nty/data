-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPowerShellShellXorS001\0x00001b32_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 8192 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = (mp.readfooter)(3328, 768)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = tostring(l_0_1)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
if (string.find)(l_0_2, ")))", 1, true) == nil then
  return mp.CLEAN
end
local l_0_3 = 0
for l_0_7 in (string.gmatch)(l_0_2, "(cg0kdqon)") do
  if l_0_7 ~= nil then
    l_0_3 = l_0_3 + 1
  end
end
if l_0_3 > 10 then
  (mp.set_mpattribute)("Lua:MultipleReturnAtTailerInB64.S001")
end
local l_0_8 = (mp.readheader)(0, 4096)
if l_0_8 == nil or l_0_8 == "" then
  return mp.CLEAN
end
local l_0_9 = ""
for l_0_13 in (string.gmatch)(l_0_8, "([A-Za-z0-9+/=]+)") do
  if l_0_13 ~= nil and l_0_13 ~= "" and (string.len)(l_0_13) > 100 then
    l_0_9 = (MpCommon.Base64Decode)(l_0_13)
    if l_0_9 ~= nil and l_0_9 ~= "" then
      l_0_9 = (string.lower)(l_0_9)
      local l_0_14 = (string.match)(l_0_9, "%[byte%[%]%]")
      if l_0_14 ~= nil and l_0_14 ~= "" then
        (mp.vfo_add_buffer)(l_0_9, "[ST]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
        ;
        (mp.set_mpattribute)("Lua:ShellBytesInB64.S001")
      end
      local l_0_15 = (string.match)(l_0_9, "0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,")
      if l_0_15 ~= nil and l_0_15 ~= "" then
        (mp.set_mpattribute)("Lua:ShellBytesInB64.S002")
      end
      local l_0_16 = (string.match)(l_0_9, "Invoke")
      if l_0_16 ~= nil and l_0_16 ~= "" then
        (mp.set_mpattribute)("Lua:InvokeInB64.S001")
      end
    end
  end
end
return mp.CLEAN

