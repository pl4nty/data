-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAHVARoleZimbra\1.luac 

-- params : ...
-- function num : 0
if GetRollingQueue("ExtendedHvaDeviceProperties") ~= nil then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
if l_0_0 == nil or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1 = "/opt/zimbra/"
if l_0_0 and (string.sub)(l_0_0, 1, #l_0_1) == l_0_1 then
  local l_0_2 = "ExtendedHvaDeviceProperties"
  local l_0_3 = 604800
  local l_0_4 = "DeviceRoles"
  local l_0_5 = "unknown"
  local l_0_6, l_0_7, l_0_8, l_0_9 = pcall(function()
  -- function num : 0_0
  local l_1_0 = MpCommon.GetDateFromTimeT
  local l_1_1 = (MpCommon.GetCurrentTimeT)()
  do return l_1_0(l_1_1) end
  -- DECOMPILER ERROR at PC7: Confused about usage of register R1 for local variables in 'ReleaseLocals'

end
)
  if l_0_6 and l_0_7 and l_0_8 and l_0_9 then
    l_0_5 = (string.format)("%04d-%02d-%02d", l_0_9, l_0_8, l_0_7)
  end
  local l_0_10 = "ZimbraMailServer,Confidence=High:Local,LastSeen=" .. l_0_5
  AppendToRollingQueue(l_0_2, l_0_4, l_0_10, l_0_3, 100)
  local l_0_11 = "http://67dda214-3ec7-4d14-aac7-7d3658a8c8ea-001.report"
  local l_0_12 = {}
  l_0_12[1] = l_0_11
  local l_0_13 = {}
  l_0_13.SIG_CONTEXT = "LUA_GENERIC"
  l_0_13.CONTENT_SOURCE = "HVA_PAYLOAD_REPORT"
  l_0_13.HVAREPORT = l_0_10
  l_0_13.TAG = "NOLOOKUP"
  pcall(mp.GetUrlReputation, l_0_12, l_0_13)
end
do
  return mp.CLEAN
end

