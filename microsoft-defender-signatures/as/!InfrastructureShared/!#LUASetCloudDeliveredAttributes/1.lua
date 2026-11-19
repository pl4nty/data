-- Threat: !InfrastructureShared
-- Name: !#LUA:SetCloudDeliveredAttributes
-- Type: 12

local l_0_0 = mp.enum_mpattributesubstring("TEL:MpCloudSuspicious_")
if #l_0_0 == 0 or l_0_0 == nil then
  return mp.CLEAN
end
for l_0_1, l_0_2 in ipairs(l_0_0) do
  local l_0_3, l_0_4, l_0_5, l_0_6, l_0_7 = string.match(l_0_2, "MpCloudSuspicious_(%d*)_(%d*)_(%d*)_(%d*)_(%d*)")
  if l_0_3 ~= nil and l_0_4 ~= nil and l_0_5 ~= nil and l_0_6 ~= nil and l_0_7 ~= nil then
    l_0_3 = tonumber(l_0_3)
    l_0_4 = tonumber(l_0_4)
    l_0_5 = tonumber(l_0_5)
    l_0_6 = tonumber(l_0_6)
    l_0_7 = tonumber(l_0_7)
    mp.set_mpattributeex("Cloud:EnsembleV1_Clean:Probability", l_0_3)
    mp.set_mpattributeex("Cloud:EnsembleV1_Malware:Probability", l_0_4)
    mp.set_mpattributeex("Cloud:FileInfo:Age", l_0_5)
    mp.set_mpattributeex("Cloud:FileInfo:Prevalence", l_0_6)
    mp.set_mpattributeex("Cloud:FileInfo:Rtp60", l_0_7)
    return mp.INFECTED
  end
end
return mp.CLEAN
