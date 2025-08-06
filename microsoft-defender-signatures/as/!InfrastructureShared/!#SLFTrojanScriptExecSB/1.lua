-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanScriptExecSB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_1 and l_0_2 ~= nil then
  local l_0_3 = (MpCommon.PathToWin32Path)(l_0_2)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  l_0_3 = (string.lower)(l_0_3)
  if StringEndsWith(l_0_3, ".vbs") then
    return mp.CLEAN
  end
  if not (mp.IsMotwForFile)(l_0_3) then
    return mp.CLEAN
  end
  local l_0_4, l_0_5 = (mp.GetMotwZoneForFile)(l_0_3)
  if l_0_5 ~= nil and l_0_5 >= 3 then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

