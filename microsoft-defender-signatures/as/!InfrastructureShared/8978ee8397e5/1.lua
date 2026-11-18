-- Threat: !InfrastructureShared
-- Name: 8978ee8397e5
-- Type: 21

function bytes_to_int(l_1_0, l_1_1, l_1_2, l_1_3)
  if not l_1_3 then
    error("need four bytes to convert to int", 2)
  end
  return l_1_0 + l_1_1 * 256 + l_1_2 * 65536 + l_1_3 * 16777216
end

function pointer2int(l_2_0, l_2_1)
  local l_2_2 = string.byte(l_2_0, l_2_1)
  local l_2_3 = string.byte(l_2_0, l_2_1 + 1)
  local l_2_4 = string.byte(l_2_0, l_2_1 + 2)
  local l_2_5 = string.byte(l_2_0, l_2_1 + 3)
  return (bytes_to_int(l_2_2, l_2_3, l_2_4, l_2_5))
end

function decryptSub(l_3_0)
  l_3_0 = string.gsub(l_3_0, "@", "")
  l_3_0 = string.gsub(l_3_0, "!", "")
  l_3_0 = string.gsub(l_3_0, "*", "")
  l_3_0 = string.gsub(l_3_0, "#", "")
  l_3_0 = string.gsub(l_3_0, "%^", "")
  l_3_0 = string.gsub(l_3_0, "~", "")
  l_3_0 = string.gsub(l_3_0, "+", "")
  l_3_0 = string.gsub(l_3_0, "%[", "")
  l_3_0 = string.gsub(l_3_0, "]", "")
  l_3_0 = string.gsub(l_3_0, "%%", "")
  return l_3_0
end

mp.readprotection(false)
if hstrlog[1].matched and peattributes.isdll and peattributes.hasexports then
  local l_0_0 = hstrlog[1].VA
  local l_0_1 = pe.mmap_va(l_0_0 + 7, 5)
  local l_0_2 = pointer2int(l_0_1, 1)
  local l_0_3 = pe.mmap_va(l_0_2, 97)
  if string.match(l_0_3, "Sistema indispon") ~= nil then
    return mp.CLEAN
  end
  l_0_3 = string.gsub(l_0_3, "@", "")
  l_0_3 = string.gsub(l_0_3, "!", "")
  l_0_3 = string.gsub(l_0_3, "*", "")
  l_0_3 = string.gsub(l_0_3, "#", "")
  if string.match(l_0_3, "Sistema indispon") ~= nil and string.match(l_0_3, "vel no momento.") ~= nil then
    return mp.INFECTED
  end
end
if hstrlog[4].matched then
  local l_0_4 = hstrlog[4].VA
  local l_0_5 = pe.mmap_va(l_0_4 + 10, 5)
  local l_0_6 = pointer2int(l_0_5, 1)
  local l_0_7 = pe.mmap_va(l_0_6, 120)
  if string.match(l_0_7, "Este navegador n\227o possui o n\237vel de seguran\231a exigido pel") ~= nil then
    return mp.CLEAN
  end
  local l_0_8 = decryptSub(l_0_7)
  if string.match(l_0_8, "Este navegador n\227o possui o n\237vel de seguran\231a exigido pel") ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
