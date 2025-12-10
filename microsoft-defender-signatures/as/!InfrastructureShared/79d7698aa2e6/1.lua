-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\79d7698aa2e6\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)((mp.GetProcessCommandLine)(l_0_0))
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2, l_0_3 = (MpCommon.StringRegExpSearch)("(?i)echo\\s+([A-Za-z0-9+/=]+)\\s*\\|\\s*base64\\s*-\\s*d", l_0_1)
do
  if l_0_2 then
    local l_0_4 = (MpCommon.Base64Decode)(l_0_3)
    if l_0_4 ~= nil and l_0_4 ~= "" then
      (MpCommon.BmTriggerSig)(l_0_0, "XplatCmdB64", l_0_4)
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

