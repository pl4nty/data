-- Threat: !InfrastructureShared
-- Name: !#Lua:FileNameAttribute.A
-- Type: 12
-- MpAttributes: !MpIsAMSIScan

local l_0_0 = mp.get_parent_filehandle()
if not mp.is_handle_nil(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or 47 < #l_0_1 then
  return mp.CLEAN
end
if string.find(l_0_1, " ", 1, true) ~= nil then
  l_0_1 = l_0_1:gsub("%s", "/x20")
  if l_0_1 == nil or 47 < #l_0_1 then
    return mp.CLEAN
  end
end
local l_0_2 = "Lua:FnameAttr!"
mp.set_mpattribute(l_0_2 .. l_0_1)
local l_0_3
if string.sub(l_0_1, #l_0_1 - 3, #l_0_1 - 3) == "." then
  l_0_3 = string.sub(l_0_1, -3)
elseif string.sub(l_0_1, #l_0_1 - 4, #l_0_1 - 4) == "." then
  l_0_3 = string.sub(l_0_1, -4)
elseif string.sub(l_0_1, #l_0_1 - 2, #l_0_1 - 2) == "." then
  l_0_3 = string.sub(l_0_1, -2)
end
if l_0_3 ~= nil and 1 < #l_0_3 then
  local l_0_4 = "Lua:FileExtensionAttr!" .. l_0_3
  mp.set_mpattribute(l_0_4)
  local l_0_5 = string.sub(l_0_1, 1, #l_0_1 - (#l_0_3 + 1))
  local l_0_6 = "Lua:FnameNoExAttr!" .. l_0_5
  mp.set_mpattribute(l_0_6)
end
return mp.CLEAN
