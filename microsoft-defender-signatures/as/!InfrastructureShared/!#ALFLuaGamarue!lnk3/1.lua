-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:Gamarue!lnk3
-- Type: 13
-- MpAttributes: //RPF:IS_Lnk

local l_0_0 = mp.getfilesize()
if l_0_0 < 24 or 255 < l_0_0 then
  return mp.CLEAN
end
if mp.getfilename():find("\\start menu\\programs\\startup\\%a+%.lnk", 1, false) then
  local l_0_1 = tostring(headerpage)
  local l_0_2 = string.lower(l_0_1)
  if l_0_2:find("\\all users\\ob%w+%.exe", 1, false) ~= nil or l_0_2:find("\\programdata\\ob%w+%.exe", 1, false) ~= nil or l_0_2:find("\\application data\\ob%w+%.exe", 1, false) ~= nil or l_0_2:find("\\appdata\\roaming\\ob%w+%.exe", 1, false) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
