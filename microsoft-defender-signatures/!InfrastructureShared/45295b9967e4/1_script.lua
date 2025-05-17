-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\45295b9967e4\1_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
local l_0_0 = nil
local l_0_1 = (mp.GetBruteMatchData)()
if l_0_1.is_header then
  l_0_0 = (string.lower)(tostring(headerpage))
else
  l_0_0 = (string.lower)(tostring(footerpage))
end
if l_0_0:find("new-settingoverride", 1, true) then
  local l_0_2 = l_0_0:match("section amsirequestbodyscanning %-parameters @?%((.*)%)")
  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_0_3 then
    TT_SendBMSigTrigger(l_0_3, "AMSIBodyScanControl", l_0_2, 1)
  end
  set_research_data("AMSIBodyScanControl", l_0_2, false)
  return mp.INFECTED
end
do
  return mp.CLEAN
end

