-- Threat: !InfrastructureShared
-- Name: !#000000_First_OfficeFrame
-- Type: 16

local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_CONTROL_GUID)
local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_SCANREASON)
if l_0_0 and string.match(l_0_1, "9203c2cb%-1dc1%-482d%-967e%-597aff270f0d") then
  local l_0_4, l_0_5 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_FRAME_URL)
  if l_0_4 and string.match(l_0_5, ":8000/") then
    if l_0_2 and l_0_3 ~= mp.SCANREASON_VALIDATION_PRESCAN then
      mp.aggregate_mpattribute("Context:OfficeFrame")
    end
    mp.aggregate_mpattribute("//MpIsIEVScan")
    return mp.TRUE
  end
end
return mp.FALSE
