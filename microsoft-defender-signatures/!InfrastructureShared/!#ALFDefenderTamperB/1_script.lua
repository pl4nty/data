-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFDefenderTamperB\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
do
  if l_0_0 == mp.SCANREASON_AMSI then
    local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
    if l_0_1 ~= nil then
      l_0_1 = (string.lower)(l_0_1)
      if l_0_1:find("wsmprovhost.exe", 1, true) then
        return mp.INFECTED
      end
    end
  end
  return mp.CLEAN
end

