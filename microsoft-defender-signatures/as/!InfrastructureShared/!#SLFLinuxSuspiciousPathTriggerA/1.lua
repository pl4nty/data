-- Threat: !InfrastructureShared
-- Name: !#SLF:Linux/SuspiciousPathTrigger.A
-- Type: 12
-- MpAttributes: RPF:TopLevelFile

if versioning.GetProduct() == 24 then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_UNKNOWN then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 < 10 then
  return mp.CLEAN
end
local l_0_2 = {
  "/tmp/37090basiclevelvirus/",
  "/tmp/abnormal/",
  "/tmp/escape/"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_4, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
