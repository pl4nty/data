-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTamperingWin32AppLockerMDEB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = tostring(headerpage) .. tostring(footerpage)
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
do
  local l_0_1 = (string.match)(l_0_0, "set%-applockerpolicy%s+%-xmlpolicy%s+(.-%.xml)") or ""
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_2 = l_0_1:gsub("\'", "")
  l_0_2 = l_0_2:gsub("\"", "")
  l_0_2 = l_0_2:gsub("^%.\\", "")
  local l_0_3 = l_0_2:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
  if pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentAppLockerPolicyFileDropped", l_0_3) then
    return mp.INFECTED
  end
  return mp.CLEAN
end

