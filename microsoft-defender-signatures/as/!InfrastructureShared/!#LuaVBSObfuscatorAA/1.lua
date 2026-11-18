-- Threat: !InfrastructureShared
-- Name: !#Lua:VBS/Obfuscator.AA
-- Type: 13
-- MpAttributes: ALFPER:VBS/Obfuscator.AA

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.get_parent_filehandle()
if mp.is_handle_nil(r0_0) then
  return mp.CLEAN
end
local r0_1 = mp.get_filesize_by_handle(r0_0)
if r0_1 > 65536 then
  return mp.CLEAN
end
mp.readprotection(false)
local r0_2 = mp.readfile_by_handle(r0_0, 0, r0_1)
if r0_2 == nil then
  return mp.CLEAN
end
r0_2 = tostring(r0_2)
local r0_3 = string.match(r0_2, '%z\r%z\n%zS%zT%z %z=%z %z"%z(.-)"%z\r%z\n')
if r0_3 == nil then
  return mp.CLEAN
end
local r0_4 = string.match(r0_2, '%z\r%z\n%zN%zN%z %z=%z %z"(.-)%z"%z\r%z\n')
if r0_4 == nil then
  return mp.CLEAN
end
local r0_5 = 0
for r0_6 in r0_4:gmatch("..") do
  local r0_7, r0_8 = string.byte(r0_6, 1, 2)
  r0_5 = r0_5 + r0_7 * 256 + r0_8
end
local r0_9 = ""
for r0_10 in r0_3:gmatch("..") do
  local r0_11, r0_12 = string.byte(r0_10, 1, 2)
  local r0_13 = r0_9
  local r0_14 = string.format
  local r0_15 = "%c"
  local r0_16 = r0_12 * 256 + r0_11 - r0_5
  r0_16 = r0_16 + string.len(r0_4) / 2
  r0_9 = r0_13 .. r0_14(r0_15, r0_16)
end
mp.vfo_add_buffer(r0_9, "[Obfuscator.AA]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
