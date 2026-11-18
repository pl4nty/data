-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:IOAVVtSample
-- Type: 13

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil then
  return mp.CLEAN
end
if string.len(l_0_0) < 51 then
  return mp.CLEAN
end
if l_0_0:sub(1, 51):lower() ~= "https://vtsamples.commondatastorage.googleapis.com/" then
  return mp.CLEAN
end
return mp.INFECTED
