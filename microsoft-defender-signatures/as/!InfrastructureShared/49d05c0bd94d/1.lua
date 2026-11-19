-- Threat: !InfrastructureShared
-- Name: 49d05c0bd94d
-- Type: 21

if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
if mp.get_mpattribute("SCPT:AICustomDiscovery.LangChainPy") then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if type(l_0_0) ~= "string" or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if type(l_0_1) ~= "string" or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.gsub(l_0_1, "/", "\\")
local l_0_2 = string.match(l_0_1, "\\langchain\\agents\\(.+)$")
if not l_0_2 then
  return mp.CLEAN
end
if l_0_2 ~= "__init__.py" and l_0_2 ~= "__init__.pyc" then
  local l_0_3 = string.match(l_0_2, "^__pycache__\\(.+)$") or l_0_2
  if not string.match(l_0_3, "^__init__%.cpython%-%d+%.pyc$") and not string.match(l_0_3, "^__init__%.cpython%-%d+%.opt%-[12]%.pyc$") then
    return mp.CLEAN
  end
end
mp.set_mpattribute("MpDisableCaching")
MpCommon.BmTriggerSig(l_0_0, "AIDiscoveryCustom_LangChainPy", l_0_1)
return mp.INFECTED
