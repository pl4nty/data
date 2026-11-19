-- Threat: !InfrastructureShared
-- Name: 11956216fd76
-- Type: 21

if pevars.sigaddr == 2138046464 then
  mp.readprotection(false)
  local l_0_0 = pe.mmap_va(pevars.sigaddr, 512)
  local l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11
  l_0_1, l_0_2 = string.gsub(l_0_0, "\139\192", "")
  l_0_1, l_0_3 = string.gsub(l_0_1, "\139\210", "")
  l_0_1, l_0_4 = string.gsub(l_0_1, "\138\210", "")
  l_0_1, l_0_5 = string.gsub(l_0_1, "\135\255", "")
  l_0_1, l_0_6 = string.gsub(l_0_1, "\139\246", "")
  l_0_1, l_0_7 = string.gsub(l_0_1, "QY", "")
  l_0_1, l_0_8 = string.gsub(l_0_1, "\138\237", "")
  l_0_1, l_0_10 = string.gsub(l_0_1, "\144\144+", "")
  l_0_1, l_0_11 = string.gsub(l_0_1, "\135\210", "")
  l_0_1, l_0_9 = string.gsub(l_0_1, "V^", "")
  local l_0_12 = l_0_2 + l_0_3 + l_0_4 + l_0_5 + l_0_6 + l_0_7 + l_0_8 + l_0_9 + l_0_10 + l_0_11
  if l_0_12 < 65 then
    return mp.CLEAN
  end
  local l_0_13 = "!decrypted" .. l_0_1
  mp.vfo_add_buffer(l_0_13, "[Obfuscator.ZV]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  return mp.LOWFI
end
return mp.CLEAN
