-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\264_645.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  if not l_0_1 then
    return mp.CLEAN
  end
  l_0_1 = (string.lower)(l_0_1)
  if l_0_1:find("taniumclient", 1, true) or l_0_1:find("taniumcx", 1, true) then
    return mp.INFECTED
  end
  local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_0_2 and l_0_3 ~= nil then
    local l_0_4 = (string.lower)(l_0_3)
    if l_0_4:find("\\tanium\\", 1, true) or l_0_4:find("hostscript.vbe", 1, true) then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

