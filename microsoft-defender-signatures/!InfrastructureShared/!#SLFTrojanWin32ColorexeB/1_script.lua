-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32ColorexeB\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
do
  if (string.find)(l_0_0, "\\spool\\drivers\\color\\", 1, true) ~= nil then
    local l_0_1 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))
    if not l_0_1 or l_0_1 == "" then
      return mp.CLEAN
    end
    if l_0_1 == "colorcpl.exe" then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

