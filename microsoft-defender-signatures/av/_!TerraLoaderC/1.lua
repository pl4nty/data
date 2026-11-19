-- Threat: \xac!TerraLoader.C
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & pea_isdll & (LUA:FileSizeLE40000.A | LUA:FileSizeLE80000.A) & pea_32bitmachine & pea_x86_image & pea_hasexports & BM_UnsignedDll & LUA:FileSizeGT50KB.B

local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 == 0 or l_0_1 == nil or 32 < l_0_0 then
  return mp.CLEAN
end
local l_0_2 = ""
local l_0_3 = {}
local l_0_4 = 0
local l_0_5 = 0

local function l_0_6(l_1_0)
  if #l_1_0 < 2 then
    return false
  end
  local l_1_1 = {
    "8",
    "16",
    "32",
    "64",
    "128",
    "256"
  }
  for l_1_2, l_1_3 in ipairs(l_1_1) do
    local l_1_4 = "([a-zA-Z])" .. l_1_3 .. "$"
    if string.match(l_1_0, l_1_4) then
      return true
    end
  end
  return false
end

mp.readprotection(false)
for l_0_7 = 1, l_0_0 do
  l_0_2 = pe.mmap_string_rva(l_0_1[l_0_7].namerva, 64)
  if l_0_2 ~= nil then
    l_0_3 = pe.mmap_rva_nofastfail(l_0_1[l_0_7].rva, 3)
    if #l_0_3 ~= 3 then
      return mp.CLEAN
    end
    if string.byte(l_0_3, 1) == 49 and string.byte(l_0_3, 2) == 192 and string.byte(l_0_3, 3) == 195 then
      l_0_4 = l_0_4 + 1
      if l_0_6(l_0_2) then
        l_0_5 = l_0_5 + 1
      end
    end
  end
end
mp.readprotection(true)
if l_0_4 < 9 or l_0_5 < l_0_4 / 2 then
  return mp.CLEAN
end
return mp.INFECTED
