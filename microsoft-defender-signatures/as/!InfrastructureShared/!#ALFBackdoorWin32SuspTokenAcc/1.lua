-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFBackdoorWin32SuspTokenAcc\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_ID)
  if l_0_0 == 4 then
    local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
    if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
      return mp.CLEAN
    end
    if (string.match)(l_0_2, "^a_%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%.pwd$") and (string.find)(l_0_1, "\\appdata\\local\\packages\\microsoft.aad.brokerplugin_", 1, true) then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

