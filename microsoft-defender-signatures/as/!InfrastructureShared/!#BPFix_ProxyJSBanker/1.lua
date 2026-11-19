-- Threat: !InfrastructureShared
-- Name: !#BPFix_Proxy:JS/Banker
-- Type: 13
-- MpAttributes: AGGLOWFI:BankerProxy

local l_0_0 = mp.getfilesize()
if 40960 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2 = string.find(l_0_1, "\"%+\"")
if l_0_2 == nil then
  return mp.CLEAN
end
mp.vfo_add_buffer(l_0_1:gsub("\"%+\"", ""), "[BPFix]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
