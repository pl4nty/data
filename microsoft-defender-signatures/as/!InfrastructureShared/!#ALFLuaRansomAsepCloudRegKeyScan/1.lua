-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:RansomAsepCloudRegKeyScan
-- Type: 13
-- MpAttributes: /RansomAsepCloudRegKeyScan & RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if l_0_0 < 16 or 3145728 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILE_AGE)
if 300 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = {
  ntrunkey = true,
  runkey = true,
  runonce = true,
  runonceex = true
}
local l_0_3 = mp.GetResmgrBasePlugin()
l_0_3 = (l_0_3 == nil and "" or l_0_3):lower()
if l_0_2[l_0_3] ~= true then
  return mp.CLEAN
end
local l_0_4 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
l_0_4 = (l_0_4 == nil and "" or l_0_4):lower()
local l_0_5 = MpCommon.ExpandEnvironmentVariables("%programfiles%")
l_0_5 = (l_0_5 == nil and "" or l_0_5):lower()
local l_0_6 = MpCommon.ExpandEnvironmentVariables("%programfiles(x86)%")
l_0_6 = (l_0_6 == nil and "" or l_0_6):lower()
if l_0_4:find(l_0_5, 1, true) ~= nil or l_0_4:find(l_0_6, 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_7 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
l_0_7 = (l_0_7 == nil and "" or l_0_7):lower()
if not sysio.IsFileExists(l_0_4 .. "\\" .. l_0_7) then
  return mp.CLEAN
end
return mp.INFECTED
