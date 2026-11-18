-- Threat: !InfrastructureShared
-- Name: 7b783ba6b39f
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
  l_3_0 = string.gsub(l_3_0, "#", "")
  l_3_0 = string.gsub(l_3_0, "@", "")
  l_3_0 = string.gsub(l_3_0, "*", "")
  return l_3_0
end

mp.readprotection(false)
if hstrlog[6].matched then
  local l_0_0 = hstrlog[6].VA
  local l_0_1 = pe.mmap_va(l_0_0 + 19, 5)
  local l_0_2 = pointer2int(l_0_1, 1)
  local l_0_3 = pe.mmap_va(l_0_2, 10)
  if string.match(l_0_3, "%.html") ~= nil then
    return mp.CLEAN
  end
  local l_0_4 = decryptSub(l_0_3)
  if string.match(l_0_4, "%.html") ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
