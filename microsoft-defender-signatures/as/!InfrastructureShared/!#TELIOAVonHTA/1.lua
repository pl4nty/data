-- Threat: !InfrastructureShared
-- Name: !#TEL:IOAVonHTA
-- Type: 13
-- MpAttributes: Lua:HTAExt

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil then
  return mp.CLEAN
end
return mp.INFECTED
