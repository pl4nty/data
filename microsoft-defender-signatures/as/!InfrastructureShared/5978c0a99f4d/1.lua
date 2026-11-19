-- Threat: !InfrastructureShared
-- Name: 5978c0a99f4d
-- Type: 21

local l_0_0
if hstrlog[1].matched then
  l_0_0 = hstrlog[1].VA
end
if hstrlog[2].matched then
  l_0_0 = hstrlog[2].VA
end
if hstrlog[3].matched then
  l_0_0 = hstrlog[3].VA
end
if hstrlog[4].matched then
  l_0_0 = hstrlog[4].VA
end
if hstrlog[5].matched then
  l_0_0 = hstrlog[5].VA
end
if l_0_0 == 2138046464 or l_0_0 == 2146697216 then
  mp.readprotection(false)
  local l_0_1 = pe.mmap_va(l_0_0, 512)
  local l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10
  local l_0_11, l_0_12 = string.gsub(l_0_1, "\139\192", "")
  l_0_11, l_0_2 = string.gsub(l_0_11, "\139\210", "")
  l_0_11, l_0_3 = string.gsub(l_0_11, "\138\210", "")
  l_0_11, l_0_4 = string.gsub(l_0_11, "\135\255", "")
  l_0_11, l_0_5 = string.gsub(l_0_11, "\139\246", "")
  l_0_11, l_0_6 = string.gsub(l_0_11, "QY", "")
  l_0_11, l_0_7 = string.gsub(l_0_11, "\138\237", "")
  l_0_11, l_0_8 = string.gsub(l_0_11, "\144\144+", "")
  l_0_11, l_0_9 = string.gsub(l_0_11, "\135\210", "")
  l_0_11, l_0_10 = string.gsub(l_0_11, "V^", "")
  local l_0_13 = 0
  if hstrlog[4].matched then
    local l_0_14 = 0
    repeat
      l_0_11, l_0_14 = string.gsub(l_0_11, "V_", "")
      l_0_13 = l_0_13 + l_0_14
    until l_0_14 == 0
  end
  l_0_13 = l_0_13 + l_0_12 + l_0_2 + l_0_3 + l_0_4 + l_0_5 + l_0_6 + l_0_7 + l_0_10 + l_0_8 + l_0_9
  if l_0_13 < 65 then
    return mp.CLEAN
  end
  local l_0_15 = "!decrypted" .. l_0_11
  mp.vfo_add_buffer(l_0_15, "[Obfuscator.ZV]", mp.ADD_VFO_PEPACKED)
  return mp.LOWFI
end
return mp.CLEAN
