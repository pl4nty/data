-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6fd717249370\1.luac 

-- params : ...
-- function num : 0
if IsDeviceHVA() == false then
  return mp.CLEAN
end
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = (string.match)(l_0_1, "\\\\([%w\\%.%-]+)")
if l_0_2 ~= nil then
  local l_0_3 = "https://"
  l_0_2 = l_0_3 .. l_0_2
  l_0_2 = (string.gsub)(l_0_2, "\\", "/")
else
  do
    l_0_2 = (string.match)(l_0_1, "http([%:%w/%.%-]+)")
    if l_0_2 == nil then
      return mp.CLEAN
    end
    l_0_2 = "http" .. l_0_2
    if #l_0_2 < 10 then
      return mp.CLEAN
    end
    local l_0_4 = {}
    l_0_4.SIG_CONTEXT = "CmdHstr"
    l_0_4.CONTENT_SOURCE = "Command Line"
    l_0_4.FILELESS = "true"
    l_0_4.CMDLINE_URL = "true"
    l_0_4.BREAK_AT_FIRST_HIT_MALWARE = "60"
    l_0_4.BREAK_AT_FIRST_HIT_PHISH = "60"
    l_0_4.BREAK_AT_FIRST_HIT_CLEAN = "60"
    local l_0_5 = {}
    l_0_5[1] = l_0_2
    if CheckUrlReputationSimple(l_0_5, l_0_4, 60) == true then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

