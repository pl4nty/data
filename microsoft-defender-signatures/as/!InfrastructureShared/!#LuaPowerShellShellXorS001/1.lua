-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShell.ShellXor.S001
-- Type: 12
-- MpAttributes: BM_TEXT_FILE | Nscript:Type_ps

local l_0_0 = mp.getfilesize()
if l_0_0 < 8192 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfooter(3328, 768)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = tostring(l_0_1)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if string.find(l_0_2, ")))", 1, true) == nil then
  return mp.CLEAN
end
local l_0_3 = 0
for l_0_4 in string.gmatch(l_0_2, "(cg0kdqon)") do
  if l_0_4 ~= nil then
    l_0_3 = l_0_3 + 1
  end
end
if 10 < l_0_3 then
  mp.set_mpattribute("Lua:MultipleReturnAtTailerInB64.S001")
end
local l_0_5 = mp.readheader(0, 4096)
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
local l_0_6 = ""
for l_0_7 in string.gmatch(l_0_5, "([A-Za-z0-9+/=]+)") do
  if l_0_7 ~= nil and l_0_7 ~= "" and string.len(l_0_7) > 100 then
    l_0_6 = MpCommon.Base64Decode(l_0_7)
    if l_0_6 ~= nil and l_0_6 ~= "" then
      l_0_6 = string.lower(l_0_6)
      local l_0_8 = string.match(l_0_6, "%[byte%[%]%]")
      if l_0_8 ~= nil and l_0_8 ~= "" then
        mp.vfo_add_buffer(l_0_6, "[ST]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
        mp.set_mpattribute("Lua:ShellBytesInB64.S001")
      end
      local l_0_9 = string.match(l_0_6, "0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,")
      if l_0_9 ~= nil and l_0_9 ~= "" then
        mp.set_mpattribute("Lua:ShellBytesInB64.S002")
      end
      local l_0_10 = string.match(l_0_6, "Invoke")
      if l_0_10 ~= nil and l_0_10 ~= "" then
        mp.set_mpattribute("Lua:InvokeInB64.S001")
      end
    end
  end
end
return mp.CLEAN
