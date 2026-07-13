-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8fd75a61ca72\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
set_research_data("MatchingCommandLine", l_0_1, false)
local l_0_2 = (mp.GetParentProcInfo)(l_0_0)
if l_0_2 ~= nil and l_0_2.ppid ~= nil then
  local l_0_3 = (mp.GetProcessCommandLine)(l_0_2.ppid)
  if l_0_3 ~= nil and l_0_3 ~= "" then
    set_research_data("Parentcommandline", l_0_3, false)
    local l_0_4 = (mp.GetParentProcInfo)(l_0_2.ppid)
    if l_0_4 ~= nil and l_0_4.ppid ~= nil then
      local l_0_5 = (mp.GetProcessCommandLine)(l_0_4.ppid)
      if l_0_5 ~= nil and l_0_5 ~= "" then
        set_research_data("GrandParentCommandline", l_0_5, false)
      end
    end
  end
end
do
  return mp.INFECTED
end

