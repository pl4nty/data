-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4dd7a835399a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = false
local l_0_1 = (mp.GetParentProcInfo)()
do
  if l_0_1 ~= nil then
    local l_0_2 = (string.lower)(l_0_1.image_path)
    if (string.find)(l_0_2, "\\explorer.exe", 1, true) then
      l_0_0 = true
    end
  end
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_3 = (mp.GetScannedPPID)()
  if l_0_3 == nil then
    return mp.CLEAN
  end
  local l_0_4 = (mp.GetProcessCommandLine)(l_0_3)
  if l_0_4 == nil then
    return mp.CLEAN
  end
  local l_0_5 = {}
  l_0_5.SIG_CONTEXT = "CMD"
  l_0_5.CONTENT_SOURCE = "MSHTA_CMDLINE"
  l_0_5.PROCESS_CONTEXT = "mshta.exe"
  l_0_5.FILELESS = "true"
  l_0_5.CMDLINE_URL = "true"
  if ExtractUrlGetReputation(l_0_4, l_0_5, true, 2, 60, false, 3000) then
    return mp.INFECTED
  end
  return mp.CLEAN
end

