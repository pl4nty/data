-- Threat: !InfrastructureShared
-- Name: !#Lua:ContIOAVRetelesh.A
-- Type: 8

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("^sample%d%d%d%.") then
  pe.set_peattribute("enable_vmm_grow", true)
  pe.set_peattribute("deep_analysis", true)
  return mp.INFECTED
end
return mp.CLEAN
