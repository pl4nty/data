-- Threat: !InfrastructureShared
-- Name: !#LUA:Backdoor:Win64/Capybara
-- Type: 13
-- MpAttributes: HSTR:Backdoor:Win64/Capybara.T

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2
local l_0_3 = "HSTR:Backdoor:Win64/Capybara!"
if mp.get_mpattributesubstring(l_0_3) then
  local l_0_4 = mp.enum_mpattributesubstring(l_0_3)
  local l_0_5 = l_0_4 and l_0_4[1]
  if not l_0_5 then
    return mp.CLEAN
  end
  local l_0_6 = string.sub(l_0_5, #l_0_3 + 1)
  if l_0_6 == nil then
    return mp.CLEAN
  end
  local l_0_7 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_7 == nil then
    return mp.CLEAN
  end
  l_0_2 = l_0_7 .. "\\" .. l_0_6
  if not sysio.IsFileExists(l_0_2) then
    return mp.CLEAN
  end
end
MpCommon.BmTriggerSig(l_0_1, "Backdoor:Win64/Capybara", l_0_2)
return mp.INFECTED
