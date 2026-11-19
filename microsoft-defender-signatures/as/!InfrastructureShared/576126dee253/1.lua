-- Threat: !InfrastructureShared
-- Name: 576126dee253
-- Type: 21

if pehdr.TimeDateStamp ~= 0 then
  local l_0_0 = MpCommon.GetCurrentTimeT()
  if l_0_0 > pehdr.TimeDateStamp then
    local l_0_1 = l_0_0 - pehdr.TimeDateStamp
    if l_0_1 <= 86400 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
