-- Threat: !InfrastructureShared
-- Name: !#ALF:TrojanDropper:Win64/SplitLoaderInstaller.A!dha
-- Type: 10
-- MpAttributes: pea_hasexports & !PEPCODE:HasDigitalSignature

local l_0_0 = {
  ["?getwindowinfos@@yajxz"] = true,
  generatekey = true,
  generatekeyw = true,
  memloadfunc = true
}
local l_0_1 = mp.getfilesize()
if 1048576 < l_0_1 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pe.get_exports()
local l_0_4 = 0
if l_0_2 ~= 4 then
  return mp.CLEAN
end
for l_0_5 = 1, l_0_2 do
  local l_0_6 = pe.mmap_string_rva(l_0_3[l_0_5].namerva, 64)
  if l_0_6 ~= nil and l_0_0[string.lower(l_0_6)] then
    l_0_4 = l_0_4 + 1
  end
end
if l_0_4 == 4 then
  return mp.INFECTED
end
return mp.CLEAN
