-- Threat: !InfrastructureShared
-- Name: 5661a3aee8e9
-- Type: 21

local l_0_0 = mp.getfilesize()
local l_0_1 = 1
if not (peattributes.isdll and peattributes.hasexports) or 1048576 < l_0_0 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pe.get_exports()
if 15 < l_0_2 then
  return mp.CLEAN
end
for l_0_4 = 1, l_0_2 do
  local l_0_5 = pe.foffset_rva(l_0_3[l_0_4].rva)
  if l_0_0 > l_0_5 + l_0_1 then
    mp.readprotection(false)
    local l_0_6 = mp.readfile(l_0_5, l_0_1)
    mp.readprotection(true)
    if l_0_6 == "\195" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
