-- Threat: !InfrastructureShared
-- Name: 58611e0c6555
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  local l_0_1 = mp.GetSMSProcArchitecture()
  local l_0_2 = mp.GetSMSMemRanges()
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if l_0_2 == nil then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
