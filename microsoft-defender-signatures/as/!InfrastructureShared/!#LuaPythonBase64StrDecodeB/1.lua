-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPythonBase64StrDecodeB\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Lua:FileExtensionAttr!py") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 8388608 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = tostring((mp.readfile)(0, l_0_0))
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1:sub(1, 256)
local l_0_3 = l_0_2:find("exec%s*%(%s*[%w_]+%s*%(%s*b\'", 1)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = l_0_3 + (l_0_2:sub(l_0_3)):find("b\'", 1, true) + 1
if not l_0_4 then
  return mp.CLEAN
end
do
  if l_0_0 - 256 + 1 < 1 then
    local l_0_5, l_0_6 = 1
  end
  -- DECOMPILER ERROR at PC67: Confused about usage of register: R5 in 'UnsetPending'

  local l_0_7 = nil
  local l_0_8 = nil
  if not (l_0_1:sub(l_0_5, l_0_0)):find("\'%s*%)%s*%)") then
    return mp.CLEAN
  end
  local l_0_9 = nil
  local l_0_10 = nil
  if not l_0_1:sub(l_0_4, l_0_7 + (l_0_1:sub(l_0_5, l_0_0)):find("\'%s*%)%s*%)") - 2) then
    return mp.CLEAN
  end
  local l_0_11 = nil
  if (MpCommon.Base64Decode)((l_0_1:sub(l_0_4, l_0_7 + (l_0_1:sub(l_0_5, l_0_0)):find("\'%s*%)%s*%)") - 2)):reverse()) == nil then
    return mp.CLEAN
  end
  ;
  (mp.vfo_add_buffer)("CWSHACK\000" .. (MpCommon.Base64Decode)((l_0_1:sub(l_0_4, l_0_7 + (l_0_1:sub(l_0_5, l_0_0)):find("\'%s*%)%s*%)") - 2)):reverse()), "[PwsZlib]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  return mp.CLEAN
end

