-- Threat: !InfrastructureShared
-- Name: 115d73acef939
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = {
  "sqlservr.exe",
  "sqlps.exe"
}
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 and l_0_1.image_path then
  local l_0_2 = l_0_1.image_path:match("([^\\]+)$") or ""
  if Contains_any_caseinsenstive(l_0_2, l_0_0) then
    local l_0_3 = mp.GetScannedPPID()
    if l_0_3 == "" or l_0_3 == nil then
      return mp.CLEAN
    end
    local l_0_4 = mp.GetProcessCommandLine(l_0_3)
    if l_0_4 and Contains_any_caseinsenstive(l_0_4, {
      "downloadstring",
      "downloadfile"
    }) then
      MpCommon.BmTriggerSig(l_0_1.ppid, "PFApp_SqlSrvExploit_B", l_0_4)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
