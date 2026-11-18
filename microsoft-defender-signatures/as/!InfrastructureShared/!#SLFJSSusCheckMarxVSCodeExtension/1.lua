-- Threat: !InfrastructureShared
-- Name: !#SLF:JS/SusCheckMarxVSCodeExtension
-- Type: 12
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.find(l_0_0, "/.vscode/extensions/checkmarx.ast-results-2.63.0", 1, true) or string.find(l_0_0, "/.vscode/extensions/checkmarx.cx-dev-assist-1.17.0", 1, true) or string.find(l_0_0, "/.vscode/extensions/checkmarx.cx-dev-assist-1.19.0", 1, true) or string.find(l_0_0, "/.vscode/extensions/checkmarx.ast-results-2.66.0", 1, true)
if l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
