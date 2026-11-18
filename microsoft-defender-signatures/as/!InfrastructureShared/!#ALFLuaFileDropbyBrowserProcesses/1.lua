-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:FileDropbyBrowserProcesses
-- Type: 13
-- MpAttributes: Lua:CloudBlockLevelGT3

local l_0_0 = "chrome.exe|msedge.exe|firefox.exe|iexplore.exe"
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and l_0_0:find(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)) then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  local l_0_2 = {
    vbs = true,
    ps1 = true,
    [".js"] = true,
    jse = true,
    vbe = true
  }
  local l_0_3 = string.sub(l_0_1, -3)
  if l_0_3 ~= nil and l_0_2[l_0_3] == true then
    return mp.INFECTED
  end
end
return mp.CLEAN
