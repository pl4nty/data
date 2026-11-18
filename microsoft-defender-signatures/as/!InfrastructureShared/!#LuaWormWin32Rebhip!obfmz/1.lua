-- Threat: !InfrastructureShared
-- Name: !#Lua:Worm:Win32/Rebhip!obfmz
-- Type: 13
-- MpAttributes: BM_UNKNOWN_FILE

local l_0_0 = mp.getfilesize()
if l_0_0 < 16192 or 2097152 < l_0_0 then
  return mp.CLEAN
end
if 870557218 == mp.crc32(0, headerpage, 1, 16) then
  return mp.INFECTED
end
return mp.CLEAN
