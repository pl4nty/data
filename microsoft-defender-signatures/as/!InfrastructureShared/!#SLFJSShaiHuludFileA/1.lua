-- Threat: !InfrastructureShared
-- Name: !#SLF:JS/ShaiHuludFile.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:JSExt & SCPT:ObsFunc

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_0 ~= mp.SCANREASON_UNKNOWN then
  return mp.CLEAN
end
if #mp.enum_mpattributesubstring("SCPT:ShaiWorm") <= 4 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if l_0_1 == nil or l_0_1 < 409600 or 614400 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.lower(mp.getfilename(mp.FILEPATH_QUERY_FNAME))
if l_0_2 == "index.js" then
  local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_3 == nil or #l_0_3 < 3 then
    return mp.CLEAN
  end
  if string.find(l_0_3, "node", 1, true) or string.find(l_0_3, "git", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
