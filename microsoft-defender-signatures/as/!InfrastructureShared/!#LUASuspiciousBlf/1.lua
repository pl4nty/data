-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousBlf
-- Type: 13
-- MpAttributes: BM_CLFS_FILE

local l_0_0 = mp.getfilesize()
if l_0_0 < 9264 or 65536 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = false
local l_0_2 = true
mp.readprotection(false)
local l_0_3 = mp.readfile(9256, 8)
if string.byte(l_0_3, 1) == 0 and string.byte(l_0_3, 2) == 0 and string.byte(l_0_3, 3) == 0 and string.byte(l_0_3, 4) == 0 and string.byte(l_0_3, 5) == 0 and string.byte(l_0_3, 6) == 0 and string.byte(l_0_3, 7) == 0 and string.byte(l_0_3, 8) == 0 then
  l_0_2 = false
end
mp.readprotection(true)
if l_0_1 or l_0_2 then
  mp.set_mpattribute("BM_SUSP_CLFS_FILE")
end
return mp.CLEAN
