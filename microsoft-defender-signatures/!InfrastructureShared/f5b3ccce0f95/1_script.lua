-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f5b3ccce0f95\1_luac 

-- params : ...
-- function num : 0
if IsLegacyOrgMachine() then
  return mp.CLEAN
end
local l_0_0 = ((bm.get_current_process_startup_info)()).ppid
do
  if l_0_0 ~= nil then
    local l_0_1 = (string.lower)((mp.GetProcessCommandLine)(l_0_0))
    if l_0_1 ~= nil and #l_0_1 > 12 then
      l_0_1 = (string.lower)(l_0_1)
      if (string.find)(l_0_1, "\\ubu_statistikautostart.vbs", 1, true) ~= nil then
        return mp.CLEAN
      end
    end
  end
  AddResearchData("BM", true)
  bm_AddRelatedFileFromCommandLine("BM", nil, nil, 6)
  return mp.INFECTED
end

