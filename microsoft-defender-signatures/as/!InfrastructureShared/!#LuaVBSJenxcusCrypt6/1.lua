-- Threat: !InfrastructureShared
-- Name: !#Lua:VBS/JenxcusCrypt6
-- Type: 13
-- MpAttributes: SCRIPT:Worm:VBS/JenxcusCrypt6 & SCPT:ReverseBase64

local l_0_0 = mp.getfilesize()
if l_0_0 < 15000 or 60000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2 = l_0_1:match("=%s-[Dd][Ee][Cc][Rr][Yy][Pp][Tt]%([Ss][Tt][Rr][Rr][Ee][Vv][Ee][Rr][Ss][Ee]%(\"(.-)\"%)%)")
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_2:reverse()
mp.vfo_add_buffer(l_0_2, "[ReverseB64]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
