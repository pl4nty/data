-- Threat: !InfrastructureShared
-- Name: !#Lua:WindowsCommonFiles.A
-- Type: 12
-- MpAttributes: MpOnOpenOrCloseRtpScan

local l_0_0 = mp.get_parent_filehandle()
if not mp.is_handle_nil(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_1 == nil or #l_0_1 < 5 then
  return mp.CLEAN
end
local l_0_2 = "Lua:WindowsCommonFiles.A!"
if l_0_1 == "desktop.ini" then
  mp.set_mpattribute(l_0_2 .. "desktop_ini")
  return mp.INFECTED
elseif l_0_1 == "thumbs.db" then
  mp.set_mpattribute(l_0_2 .. "thumbs_db")
  return mp.INFECTED
end
return mp.CLEAN
