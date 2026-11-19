-- Threat: !InfrastructureShared
-- Name: !#Lua:SekitObfus
-- Type: 13
-- MpAttributes: SCRIPT:Sekit & MpIsPowerShellAMSIScan

local l_0_0 = mp.getfilesize()
if 2048 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(tostring(headerpage))
local l_0_2 = 0
l_0_1 = string.gsub(l_0_1, " ", "")
l_0_1 = string.gsub(l_0_1, "`", "")
l_0_1, l_0_2 = string.gsub(l_0_1, "'%+'", "")
if l_0_2 < 20 then
  return mp.CLEAN
end
if 2048 < string.len(l_0_1) then
  local l_0_3 = string.find(l_0_1, "%z")
  if l_0_3 == nil then
    return mp.CLEAN
  end
  l_0_1 = string.sub(l_0_1, 1, l_0_3)
end
mp.vfo_add_buffer(l_0_1, "[StrConcat]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.INFECTED
