-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32SuspExecSA\0x000019ce_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = (mp.GetMOTWHostUrl)()
  if isnull(l_0_1) then
    return mp.CLEAN
  end
  l_0_1 = (string.lower)(l_0_1)
  if not (l_0_1.find)(".screenconnect.com/", 1, true) or not (l_0_1.find)("&y=guest&r=", 1, true) or not (l_0_1.find)("relay.screenconnect.com", 1, true) then
    return mp.CLEAN
  end
  local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_REFERRERURL)
  if isnull(l_0_2) then
    return mp.CLEAN
  end
  l_0_2 = (string.lower)(l_0_2)
  if not contains(l_0_2, ".screenconnect.com") then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

