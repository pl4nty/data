-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFJSSusCheckMarxVSCodeExtens\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_0, "/.vscode/extensions/checkmarx.ast-results-2.63.0", 1, true) or (string.find)(l_0_0, "/.vscode/extensions/checkmarx.cx-dev-assist-1.17.0", 1, true) or (string.find)(l_0_0, "/.vscode/extensions/checkmarx.cx-dev-assist-1.19.0", 1, true) or (string.find)(l_0_0, "/.vscode/extensions/checkmarx.ast-results-2.66.0", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

