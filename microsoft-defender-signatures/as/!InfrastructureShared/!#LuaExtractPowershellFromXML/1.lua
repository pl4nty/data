-- Threat: !InfrastructureShared
-- Name: !#Lua:ExtractPowershellFromXML
-- Type: 24
-- MpAttributes: BM_JOB_FILE | (BM_XML_FILE & SCRIPT:EncodedCommand) | BM_SCHEDULEDTASK_JOBFILE

local l_0_0 = mp.getfilesize()
if 200000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
mp.readprotection(true)
l_0_1 = string.gsub(l_0_1, "%z", "")
local l_0_2 = l_0_1:gmatch("[%w+/]+=?=?")
for l_0_3 in l_0_2, nil, nil do
  if 80 < #l_0_3 then
    if mp.get_mpattribute("BM_SCHEDULEDTASK_JOBFILE") then
      mp.set_mpattribute("/BM_SCHEDULEDTASK_JOBFILE")
    end
    mp.vfo_add_buffer(MpCommon.Base64Decode(l_0_3), "[PwsCode]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  end
end
return mp.CLEAN
