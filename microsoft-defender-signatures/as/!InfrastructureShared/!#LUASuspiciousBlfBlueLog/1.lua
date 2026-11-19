-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousBlfBlueLog
-- Type: 13
-- MpAttributes: BM_CLFS_FILE

local l_0_0 = mp.getfilesize()
if l_0_0 < 2048 or 65536 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.readheader(2048, 4)
if l_0_1 ~= "\021\000\021\000" then
  return mp.CLEAN
end
local l_0_2 = mp.readheader(2088, 4)
if l_0_2 ~= "\214\000\000\000" then
  return mp.CLEAN
end
local l_0_3 = mp.readheader(3070, 4)
if l_0_3 ~= "\016\021\000\000" then
  return mp.CLEAN
end
mp.set_mpattribute("BM_SUSP_BLF_BLUELOG")
return mp.INFECTED
