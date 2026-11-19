-- Threat: !InfrastructureShared
-- Name: 217885dd6c87
-- Type: 21

local l_0_0 = mp.getfilesize()
local l_0_1 = 5
if not (peattributes.isdll and peattributes.hasexports) or 3145728 < l_0_0 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pe.get_exports()
if l_0_2 ~= 2 then
  return mp.CLEAN
end
for l_0_4 = 1, l_0_2 do
  local l_0_5 = pe.mmap_string_rva(l_0_3[l_0_4].namerva, 64)
  if l_0_5 == "FreeExtraData" then
    local l_0_6 = pe.foffset_rva(l_0_3[l_0_4].rva)
    if l_0_0 > l_0_6 + l_0_1 then
      mp.readprotection(false)
      local l_0_7 = mp.readfile(l_0_6, l_0_1)
      mp.readprotection(true)
      if l_0_7 == "U\137\229]\195" then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
