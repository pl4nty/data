-- Threat: !InfrastructureShared
-- Name: !#SLF:Python/ShaiHuludFile.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (BM_PY_FILE | Lua:PYExt)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_0 ~= mp.SCANREASON_UNKNOWN then
  return mp.CLEAN
end
if #mp.enum_mpattributesubstring("SCPT:ShaiWorm_") < 1 then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename(mp.FILEPATH_QUERY_FNAME))
if l_0_1 == "cat.py" then
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_2 == nil or #l_0_2 < 3 then
    return mp.CLEAN
  end
  if string.find(l_0_2, "bun", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
