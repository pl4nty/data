-- Threat: !InfrastructureShared
-- Name: !#Lua:NewPECreatedNoCert
-- Type: 10
-- MpAttributes: !PEPCODE:HasDigitalSignature & RPF:TopLevelFile & MpNewlyCreatedHint

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if 8388608 <= l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_2:sub(1, 8) == "\\device\\" then
  l_0_2 = MpCommon.PathToWin32Path(l_0_2)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  l_0_2 = string.lower(l_0_2)
end
local l_0_3 = MpCommon.QueryPersistContext(l_0_2, "NewPECreatedNoCert")
if not l_0_3 then
  MpCommon.AppendPersistContext(l_0_2, "NewPECreatedNoCert", 0)
end
return mp.CLEAN
