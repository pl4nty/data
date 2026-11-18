-- Threat: !InfrastructureShared
-- Name: !#Lua:VBSExecB64
-- Type: 13
-- MpAttributes: SCPT:vbs_execb64

local l_0_0 = mp.getfilesize()
if l_0_0 < 2000 or 10000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
local l_0_2 = l_0_1:match("EXECUTE%(%a-%(\"([%w=]-)\"%)%)")
if l_0_2 == nil then
  return mp.CLEAN
end
mp.vfo_add_buffer(l_0_2, "[Base64]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
