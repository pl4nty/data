-- Threat: !InfrastructureShared
-- Name: 3540ec6ade98
-- Type: 21

local l_0_0 = nri.GetRawResponseBlob()
if l_0_0 then
  local l_0_1 = MpCommon.BinaryRegExpSearch("\\\\\\\\10\\.[0-9\\.]+|172\\.[0-9\\.]+|192\\.168\\.[0-9\\.]+\\\\d+", l_0_0)
  if l_0_1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
