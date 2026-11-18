-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:Win64/VortexMiner.A!dha
-- Type: 10
-- MpAttributes: pea_hasexports

local l_0_0 = {
  "winmain",
  "_cgo_dummy_export"
}
local l_0_1 = mp.getfilesize()
if l_0_1 == nil or l_0_1 < 3145728 or 26214400 < l_0_1 then
  return mp.CLEAN
end
if pe.get_exports_count() ~= 2 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pe.get_exports()
local l_0_4 = 0
if l_0_3 == nil or l_0_2 ~= 2 then
  return mp.CLEAN
end
mp.readprotection(false)
for l_0_5 = 1, l_0_2 do
  local l_0_6 = pe.mmap_string_rva(l_0_3[l_0_5].namerva, 64)
  if l_0_6 ~= nil then
    for l_0_7, l_0_8 in ipairs(l_0_0) do
      if string.lower(l_0_6) == l_0_8 then
        l_0_4 = l_0_4 + 1
      end
      if l_0_4 == 2 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
