-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\169d71feae87f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if l_0_0 ~= nil then
    local l_0_1 = l_0_0.ppid
    if l_0_1 ~= "" and l_0_1 ~= nil then
      TrackPidAndTechnique(l_0_1, "T1505.003", "webshell_parent", 604800)
    end
  end
  return mp.INFECTED
end

