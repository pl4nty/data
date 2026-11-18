-- Threat: !InfrastructureShared
-- Name: !#LUA:PEAnomaly_TimeDateStamp
-- Type: 10

local l_0_0 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_DEBUG].RVA
local l_0_1 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_DEBUG].Size
local l_0_2 = MpCommon.GetCurrentTimeT()
if l_0_0 ~= 0 and l_0_1 ~= 0 then
  local l_0_3 = 0
  mp.readprotection(false)
  while l_0_1 > l_0_3 do
    local l_0_4 = mp.readu_u32(pe.mmap_rva(l_0_0 + l_0_3 + 12, 4), 1)
    if l_0_4 == 16 then
      return mp.CLEAN
    end
    l_0_3 = l_0_3 + 28
  end
  local l_0_5 = mp.readu_u32(pe.mmap_rva(l_0_0 + 4, 4), 1)
  mp.readprotection(true)
  if pehdr.TimeDateStamp ~= l_0_5 then
    mp.set_mpattribute("LUA:PEAnomaly_DifferentPEandDebugDirTimeStamp")
  end
  if l_0_5 ~= 0 then
    local l_0_6 = l_0_2 - l_0_5
    if l_0_6 <= 2592000 then
      mp.set_mpattribute("LUA:PEAnomaly_DebugTimeStampLastOneMonth")
    end
    if 2592000 < l_0_6 and l_0_6 <= 15638400 then
      mp.set_mpattribute("LUA:PEAnomaly_DebugTimeStampLastSixMonth")
    end
    if 15638400 < l_0_6 and l_0_6 <= 31536000 then
      mp.set_mpattribute("LUA:PEAnomaly_DebugTimeStampLastOneYear")
    end
    if 31536000 < l_0_6 and l_0_6 <= 94608000 then
      mp.set_mpattribute("LUA:PEAnomaly_DebugTimeStampLastThreeYear")
    end
    if 94608000 < l_0_6 and l_0_6 <= 157766400 then
      mp.set_mpattribute("LUA:PEAnomaly_DebugTimeStampLastFiveYear")
    end
    if 157766400 < l_0_6 and l_0_6 <= 315532800 then
      mp.set_mpattribute("LUA:PEAnomaly_DebugTimeStampLastTenYear")
    end
    if 315532800 < l_0_6 then
      mp.set_mpattribute("LUA:PEAnomaly_DebugTimeStampLastOlderThanTenYear")
    end
  else
    mp.set_mpattribute("LUA:PEAnomaly_NullDebugTimeStamp")
  end
end
if pehdr.TimeDateStamp ~= 0 then
  if l_0_2 > pehdr.TimeDateStamp then
    local l_0_7 = l_0_2 - pehdr.TimeDateStamp
    if l_0_7 <= 2592000 then
      mp.set_mpattribute("LUA:PEAnomaly_TimeStampLastOneMonth")
    end
    if 2592000 < l_0_7 and l_0_7 <= 15638400 then
      mp.set_mpattribute("LUA:PEAnomaly_TimeStampLastSixMonth")
    end
    if 15638400 < l_0_7 and l_0_7 <= 31536000 then
      mp.set_mpattribute("LUA:PEAnomaly_TimeStampLastOneYear")
    end
    if 31536000 < l_0_7 and l_0_7 <= 94608000 then
      mp.set_mpattribute("LUA:PEAnomaly_TimeStampLastThreeYear")
    end
    if 94608000 < l_0_7 and l_0_7 <= 157766400 then
      mp.set_mpattribute("LUA:PEAnomaly_TimeStampLastFiveYear")
    end
    if 157766400 < l_0_7 and l_0_7 <= 315532800 then
      mp.set_mpattribute("LUA:PEAnomaly_TimeStampLastTenYear")
    end
    if 315532800 < l_0_7 then
      mp.set_mpattribute("LUA:PEAnomaly_TimeStampLastOlderThanTenYear")
    end
  else
    mp.set_mpattribute("LUA:PEAnomaly_TimeStampHigherThanCurrentDateOrInvalid")
  end
else
  mp.set_mpattribute("LUA:PEAnomaly_NullTimeDateStamp")
end
return mp.CLEAN
