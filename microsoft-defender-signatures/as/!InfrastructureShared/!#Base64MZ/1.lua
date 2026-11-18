-- Threat: !InfrastructureShared
-- Name: !#Base64MZ
-- Type: 13
-- MpAttributes: SCPT:PossibleBase64MZHeader | BRUTE:Base64MZFile

mp.readprotection(false)
local l_0_0 = mp.readfile(0, mp.getfilesize())
local l_0_1 = l_0_0:find("TV[pq]QAA[IM]AAAAEAA")
if l_0_1 == nil or l_0_1 == 1 then
  return mp.CLEAN
end
local l_0_2 = l_0_0:match("[A-Za-z0-9+/=]+", l_0_1)
mp.vfo_add_buffer(l_0_2, "[Base64]", mp.bitor(mp.ADD_VFO_TAKE_ACTION_ON_DAD, mp.ADD_VFO_LOW_PRIORITY))
return mp.CLEAN
