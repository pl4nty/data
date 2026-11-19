-- Threat: !InfrastructureShared
-- Name: 2cd7bf32780d
-- Type: 21

local l_0_0 = MpCommon.GetPersistContextNoPath("BitlockerRansom")
if l_0_0 ~= nil then
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    if l_0_2 == "D" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
