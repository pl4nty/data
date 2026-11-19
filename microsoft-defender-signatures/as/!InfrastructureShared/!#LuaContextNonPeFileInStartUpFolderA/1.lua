-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/NonPeFileInStartUpFolder.A
-- Type: 13
-- MpAttributes: MpOnOpenOrCloseRtpScan & Lua:FileInStartupFolder

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_0 == nil or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1 = {
  js = true,
  jse = true,
  vbs = true,
  vbe = true,
  wsf = true,
  jar = true,
  hta = true,
  lnk = true,
  cmd = true,
  bat = true,
  doc = true,
  docm = true,
  docx = true,
  xls = true,
  xlsx = true
}
local l_0_2 = string.match(l_0_0, "([^\\%.]+)$")
if l_0_2 == nil or #l_0_2 < 2 or l_0_1[l_0_2] ~= true then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:Context/NonPeFileInStartUpFolder.A!" .. l_0_2)
return mp.INFECTED
