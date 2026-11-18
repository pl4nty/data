-- Threat: !InfrastructureShared
-- Name: 1a78d10b4600
-- Type: 21

if not peattributes.isdll or not peattributes.hasexports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 == nil or l_0_1 == nil or l_0_0 < 1 then
  return mp.CLEAN
end
local l_0_2 = "exportfun00"
local l_0_3 = false
for l_0_4 = 1, l_0_0 do
  local l_0_5 = l_0_1[l_0_4]
  if l_0_5 ~= nil and l_0_5.namerva ~= nil and pe.mmap_string_rva(l_0_5.namerva, #l_0_2 + 1) == l_0_2 then
    l_0_3 = true
  end
end
if not l_0_3 then
  return mp.CLEAN
end
return mp.INFECTED
