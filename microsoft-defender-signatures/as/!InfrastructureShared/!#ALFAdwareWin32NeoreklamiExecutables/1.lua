-- Threat: !InfrastructureShared
-- Name: !#ALF:Adware:Win32/NeoreklamiExecutables
-- Type: 10
-- MpAttributes: MpOnOpenOrCloseRtpScan & RPF:TopLevelFile & Lua:EXEExt

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
if #l_0_1 ~= 20 then
  return mp.CLEAN
end
local l_0_2 = mp.getfilesize()
if l_0_2 < 6291456 or 8388608 < l_0_2 then
  return mp.CLEAN
end
if l_0_0:find("\\windows\\temp\\", 1, true) ~= nil then
  local l_0_3 = l_0_0:match("temp\\([^\\]+)$")
  if l_0_3 ~= nil and #l_0_3 == 16 then
    return mp.INFECTED
  end
end
return mp.CLEAN
