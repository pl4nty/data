-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\39b37f2bdecf\1.luac 

-- params : ...
-- function num : 0
if GetRollingQueue("ExtendedDeviceProperties") ~= nil then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[1]).matched then
  l_0_0 = (this_sigattrlog[1]).utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = (string.gsub)(l_0_0, "^CBM:TagHVA!", "")
  if l_0_1 ~= nil and l_0_1 ~= "" then
    local l_0_2 = "ExtendedDeviceProperties"
    local l_0_3 = 2592000
    l_0_1 = (MpCommon.Base64Decode)(l_0_1)
    l_0_1 = explode(l_0_1, ";")
    if #l_0_1 == 6 then
      local l_0_4 = {}
      l_0_4.DeviceRole = l_0_1[1]
      l_0_4.IsInternetFacing = l_0_1[2]
      l_0_4.IsManagedByIntune = l_0_1[3]
      l_0_4.ExposureLevel = l_0_1[4]
      l_0_4.ExploitLevel = l_0_1[5]
      l_0_4.RiskScore = l_0_1[6]
      for l_0_8,l_0_9 in pairs(l_0_4) do
        AppendToRollingQueue(l_0_2, l_0_8, l_0_9, l_0_3)
      end
      ;
      (bm.add_related_string)("ExtendedDeviceProperties", l_0_0, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

