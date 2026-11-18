-- Threat: !InfrastructureShared
-- Name: !#Lua:EncryptedZipWithNonURLMotw
-- Type: 13
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & (Lua:ZipEncrypted | Lua:RarHasEncryptedFile)

local l_0_0
if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true then
  l_0_0 = mp.GetMOTWHostUrl()
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
if l_0_0:find("about:", 1, true) then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = l_0_1:lower()
  local l_0_2 = {
    "chrome.exe",
    "firefox.exe",
    "opera.exe",
    "msedge.exe",
    "brave.exe"
  }
  if contains(l_0_1, l_0_2) then
    local l_0_3 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
    if l_0_3 == nil then
      return mp.CLEAN
    end
    local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
    local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
    l_0_4 = MpCommon.PathToWin32Path(l_0_4)
    if l_0_4 ~= nil and l_0_5 ~= nil then
      l_0_4 = l_0_4:lower()
      local l_0_6 = MpCommon.GetCurrentTimeT()
      local l_0_7 = "WARCH::ProcessImagePath=" .. l_0_4 .. ";pid=" .. l_0_5 .. ";timestamp=" .. l_0_6 .. ";motw=" .. l_0_0
      if not IsKeyInRollingQueue("CC_filelist", l_0_3) then
        local l_0_8 = 31536000
        AppendToRollingQueue("CC_filelist", l_0_3, l_0_7, l_0_8, 32)
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
